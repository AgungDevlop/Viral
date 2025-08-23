#!/system/bin/sh

# FPS Unlock Script by Agung Developer (Optimized)
# Optimized for stability, compatibility, and performance
# Current date: August 23, 2025

# Function to check root access
check_root() {
    if [ $(id -u 2>/dev/null) -eq 0 ]; then
        echo "Yes"
        return 0
    else
        echo "No"
        return 1
    fi
}

# Function to check if a package is installed
check_package() {
    pm list packages | grep -q "$1" && return 0 || return 1
}

# Function to check if a property exists
check_property() {
    getprop "$1" >/dev/null 2>&1 && return 0 || return 1
}

# Function to set property with error checking
set_property() {
    local prop=$1
    local value=$2
    if check_property "$prop"; then
        setprop "$prop" "$value" && echo "[✔] Set $prop to $value" || echo "[✘] Failed to set $prop"
    else
        echo "[!] Skipped $prop (not supported)"
    fi
}

# Function to set settings with error checking
set_setting() {
    local scope=$1
    local key=$2
    local value=$3
    settings put "$scope" "$key" "$value" >/dev/null 2>&1 && echo "[✔] Set $scope $key to $value" || echo "[!] Skipped $scope $key (not supported)"
}

# Initial notification
cmd notification post -S bigtext -t 'FPS UNLOCK by Agung Developer' 'Copyright Agung Developer' 'Starting Configuration.' >/dev/null 2>&1

echo ""
echo "█▓▒▒░░░FPS UNLOCK by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5
echo "┌───────────────────────────────────────┐"
echo "│         DEVICE AND HARDWARE INFO      │"
echo "├───────────────────────────────────────┤"
echo "│ 📱 Device   : $(getprop ro.product.manufacturer) $(getprop ro.product.model) │"
echo "│ ⚙️ CPU      : $(getprop ro.board.platform) │"
echo "│ 🎮 GPU      : $(getprop ro.hardware) │"
echo "│ 📲 Android  : $(getprop ro.build.version.release) │"
thermal_temp=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000 "°C"}')
echo "│ 🔥 Thermal  : ${thermal_temp:-'N/A'} │"
echo "│ 🔰 Kernel   : $(uname -r) │"
echo "│ 🔹 Build    : $(getprop ro.build.display.id) │"
echo "│ 🛑 Root     : $(check_root) │"
echo "│ 🔗 SELinux  : $(getenforce 2>/dev/null || echo 'N/A') │"
echo "└───────────────────────────────────────┘"
echo ""

# Check thermal status
if [ -n "$thermal_temp" ] && [ "${thermal_temp%°C}" -gt 45 ]; then
    echo "[!] Warning: Device temperature is $thermal_temp. Consider cooling down before applying tweaks."
    sleep 2
fi

echo "█▓▒▒░░░WELCOME TO INSTALASI░░░▒▒▓█"
echo ""
sleep 0.5
echo ""
echo "┏━━┓╋╋╋╋╋╋╋╋╋┏━━┓"
echo "┃┏┓┣━┳┳┳━┳┳━┓┗┓┓┣━┳━┳━┓"
echo "┃┣┫┃╋┃┃┃┃┃┃╋┃┏┻┛┃┻╋┓┃┏┛"
echo "┗┛┗╋┓┣━┻┻━╋┓┃┗━━┻━┛┗━┛"
echo "╋╋╋┗━┛╋╋╋╋┗━┛"
echo ""
echo " "
sleep 3

# CPU and Job Scheduler Optimizations
(
    echo "Melonggarkan beban Cpu"
    cmd jobscheduler monitor-battery off >/dev/null 2>&1 && echo "[✔] Disabled battery monitoring for job scheduler"
    cmd jobscheduler cache-config-changes off >/dev/null 2>&1 && echo "[✔] Disabled job scheduler cache config changes"
    cmd jobscheduler enable-flex-policy --option idle --option charging >/dev/null 2>&1 && echo "[✔] Enabled job scheduler flex policy"
) &

# FPS & Refresh Rate Tweaks (SurfaceFlinger)
(
    set_property debug.sf.frame_rate_multiple_threshold 90
    set_property debug.sf.log_expensive_rendering true
    set_property debug.sf.scroll_boost_refreshrate 90
    set_property debug.sf.touch_boost_refreshrate 90
    set_property debug.sf.high_speed_scroll_factor 25
    set_property debug.sf.enable_refresh_rate_restriction_for_app_switch 1
) &

# Power and Refresh Rate Settings
(
    cmd power set-mode 0 >/dev/null 2>&1 && echo "[✔] Set power mode to 0"
    set_setting global low_power 0
    refresh_rate=90
    cmd device_config put system display_refresh_rate "$refresh_rate" >/dev/null 2>&1 && echo "[✔] Set device_config system display_refresh_rate to $refresh_rate"
    set_setting secure user_refresh_rate "$refresh_rate"
    set_setting secure miui_refresh_rate "$refresh_rate"
    set_setting system min_frame_rate "$refresh_rate"
    set_setting system max_frame_rate "$refresh_rate"
    set_setting system tran_refresh_mode "$refresh_rate"
    set_setting system last_tran_refresh_mode_in_refresh_setting "$refresh_rate"
    set_setting global min_fps "$refresh_rate"
    set_setting global max_fps "$refresh_rate"
    set_setting system tran_need_recovery_refresh_mode "$refresh_rate"
    set_setting system display_min_refresh_rate "$refresh_rate"
    set_setting system min_refresh_rate "$refresh_rate"
    set_setting system max_refresh_rate "$refresh_rate"
    set_setting system peak_refresh_rate "$refresh_rate"
    set_setting secure refresh_rate_mode "$refresh_rate"
    set_setting system thermal_limit_refresh_rate "$refresh_rate"
    set_setting system NV_FPSLIMIT "$refresh_rate"
    cmd display set-match-content-frame-rate-pref 1 >/dev/null 2>&1 && echo "[✔] Enabled match content frame rate preference"
    set_setting system power.dfps.level 0
    set_setting system disable_idle_fps true
    set_setting system disable_idle_fps.threshold 1
    set_setting system fps.idle_control false
    set_setting system metadata_dynfps.disabel 1
    set_setting system enable_dpps_dynamic_fps 0
    set_setting system display.disable_dynamic_fps 1
    set_setting system display.disable_metadata_dynamic_fps 1
    set_setting system display.low_framerate_limit "$refresh_rate"
    set_setting system display.defer_fps_frame_count 2
    set_setting system display.refresh_rate "$refresh_rate"
    set_setting system display.large_comp_hint_fps "$refresh_rate"
    set_setting system display.enable_pref_hint_for_low_fps 1
    set_setting system display.enable_optimal_refresh_rate 1
    set_setting system display.enable_idle_content_fps_hint 0
    set_setting system display.refresh_rate_changeable 0
    set_setting system display.disable_mitigated_fps 1
    set_setting system display.idle_time 0
    set_setting system display.idle_time_inactive 0
    set_setting global dfps.enable false
    set_setting global smart_dfps.enable false
    set_setting global fps.switch.thermal false
    set_setting global fps.switch.default false
    set_setting global smart_dfps.idle_fps "$refresh_rate"
    set_setting global display.idle_default_fps "$refresh_rate"
    set_setting global smart_dfps.app_switch_fps "$refresh_rate"
    set_setting global display.fod_monitor_default_fps "$refresh_rate"
    set_property debug.mediatek_high_frame_rate_multiple_display_mode 0
    set_property debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold "$refresh_rate"
    set_setting global tran_refresh_rate_video_detector.support 0
    set_setting global tran_default_auto_refresh.support 0
    set_setting global tran_default_refresh_mode "$refresh_rate"
    set_setting global tran_low_battery_60hz_refresh_rate.support 1
    set_setting global tran_90hz_refresh_rate.not_support 0
    set_setting system surfaceflinger.idle_reduce_framerate_enable false
    set_setting global tran_custom_refresh_rate_config.support 1
    set_setting global transsion.frame_override.support 0
    set_setting global transsion.tran_refresh_rate.support 0
) &

# Stable FPS Optimizations (Debug)
(
    set_property debug.sys.display.fps "$refresh_rate"
    set_property debug.sys.display_refresh_rate "$refresh_rate"
    set_property debug.sys.game.minfps "$refresh_rate"
    set_property debug.sys.game.maxfps "$refresh_rate"
    set_property debug.sys.game.minframerate "$refresh_rate"
    set_property debug.sys.game.maxframerate "$refresh_rate"
    set_property debug.sys.min_refresh_rate "$refresh_rate"
    set_property debug.sys.max_refresh_rate "$refresh_rate"
    set_property debug.sys.peak_refresh_rate "$refresh_rate"
    set_property debug.sys.sf.fps "$refresh_rate"
    set_property debug.sys.smartfps 1
    set_property debug.sys.vsync_optimization_enable false
    set_property debug.sys.hwui.dyn_vsync 0
    set_property debug.sys.vsync false
    set_property debug.sys.hwui.fps_mode 1
    set_property debug.sys.first.frame.accelerates true
    set_property debug.sys.fps_unlock_allowed "$refresh_rate"
    set_property debug.sys.display.max_fps "$refresh_rate"
    set_property debug.sys.video.max.fps "$refresh_rate"
    set_property debug.sys.surfaceflinger.idle_reduce_framerate_enable false
) &

# Stable FPS Optimizations (System)
(
    set_property sys.display.fps "$refresh_rate"
    set_property sys.display_refresh_rate "$refresh_rate"
    set_property sys.game.minfps "$refresh_rate"
    set_property sys.game.maxfps "$refresh_rate"
    set_property sys.game.minframerate "$refresh_rate"
    set_property sys.game.maxframerate "$refresh_rate"
    set_property sys.min_refresh_rate "$refresh_rate"
    set_property sys.max_refresh_rate "$refresh_rate"
    set_property sys.peak_refresh_rate "$refresh_rate"
    set_property sys.sf.fps "$refresh_rate"
    set_property sys.smartfps 1
    set_property sys.vsync_optimization_enable false
    set_property sys.hwui.dyn_vsync 0
    set_property sys.vsync false
    set_property sys.hwui.fps_mode 1
    set_property sys.first.frame.accelerates true
    set_property sys.fps_unlock_allowed "$refresh_rate"
    set_property sys.display.max_fps "$refresh_rate"
    set_property sys.video.max.fps "$refresh_rate"
    set_property sys.surfaceflinger.idle_reduce_framerate_enable false
) &

# Optimize Refresh Rate
(
    set_setting global surface_flinger.use_content_detection_for_refresh_rate false
    set_setting global media.recorder-max-base-layer-fps "$refresh_rate"
    set_setting global vendor.fps.switch.default true
    set_setting system vendor.disable_idle_fps true
    set_setting global vendor.display.default_fps "$refresh_rate"
    set_setting system vendor.display.idle_default_fps "$refresh_rate"
    set_setting system vendor.display.enable_optimize_refresh 1
    set_setting system vendor.display.video_or_camera_fps.support true
    set_property debug.hwui.refresh_rate "$refresh_rate"
    set_property debug.sf.set_idle_timer_ms 500
    set_property debug.sf.latch_unsignaled 1
    set_property debug.sf.high_fps_early_phase_offset_ns 2000000
    set_property debug.sf.high_fps_late_app_phase_offset_ns 500000
    set_setting system game_driver_min_frame_rate "$refresh_rate"
    set_setting system game_driver_max_frame_rate "$refresh_rate"
    set_setting system game_driver_power_saving_mode 0
    set_setting system game_driver_frame_skip_enable 0
    set_setting system game_driver_vsync_enable 0
    set_setting system game_driver_gpu_mode 1
    set_setting system game_driver_fps_limit "$refresh_rate"
) &

# FPS Injector
(
    set_property debug.graphics.game_default_frame_rate "$refresh_rate"
    set_property debug.graphics.game_default_frame_rate.disabled false
    set_property persist.sys.gpu_perf_mode 1
    set_property debug.mtk.powerhal.hint.bypass 1
    set_property persist.sys.surfaceflinger.idle_reduce_framerate_enable false
    set_property sys.surfaceflinger.idle_reduce_framerate_enable false
    set_property debug.sf.perf_mode 1
    set_setting global refresh.active 1
    set_property debug.hwui.disable_vsync true
    set_property debug.performance.profile 1
    set_property debug.perf.tuning 1
) &

# FPS Lock Tweaks
(
    set_setting system user_refresh_rate "$refresh_rate"
    set_setting system fps_limit "$refresh_rate"
    set_setting system max_refresh_rate_for_ui "$refresh_rate"
    set_setting system hwui_refresh_rate "$refresh_rate"
    set_setting system display_refresh_rate "$refresh_rate"
    set_setting system max_refresh_rate_for_gaming "$refresh_rate"
    set_setting system fstb_target_fps_margin_high_fps 20
    set_setting system fstb_target_fps_margin_low_fps 20
    set_setting system gcc_fps_margin 10
    set_setting global tran_low_battery_60hz_refresh_rate.support 0
    set_setting display refresh_rate "$refresh_rate"
    set_setting system sf.refresh_rate "$refresh_rate"
    set_property persist.vendor.display.refresh_rate "$refresh_rate"
) &

# Game Optimizations
echo "Menonaktifkan optimalisasi baterai untuk game yang support 120 FPS dan 90 FPS"

# Games supporting 120 FPS
for app in \
    com.netease.newspike \
    com.miHoYo.GenshinImpact \
    com.garena.game.codm \
    com.riotgames.league.wildrift \
    com.mobile.legends \
    com.tencent.ig \
    com.mobile.legends.hwag \
    com.mobile.legends.mi \
    com.garena.game.df \
    com.tencent.tmgp.sgame \
    com.roblox.client
do
    if check_package "$app"; then
        dumpsys deviceidle whitelist +"$app" >/dev/null 2>&1 && echo "[✔] $app (120FPS) tidak dibatasi oleh sistem!" || echo "[✘] Failed to whitelist $app"
    else
        echo "[!] $app not installed"
    fi
done

# Games supporting 90 FPS
for app in \
    com.dts.freefireth \
    com.dts.freefiremax \
    com.garena.game.kgvn
do
    if check_package "$app"; then
        dumpsys deviceidle whitelist +"$app" >/dev/null 2>&1 && echo "[✔] $app (90FPS) tidak dibatasi oleh sistem!" || echo "[✘] Failed to whitelist $app"
    else
        echo "[!] $app not installed"
    fi
done

echo ""
echo "PAKSA REFRESH RATE MAXIMAL [✓]"
sleep 0.5
echo ""
echo "ALL DONE SET [✓]"
echo ""
sleep 0.5
echo ""
echo "‼️SELAMAT MENIKMATI ‼️"
echo ""
sleep 0.5
echo ""
echo "AGUNG DEVELOPER"
echo ""
sleep 0.5
echo ""
echo "[!] Note: Avoid rebooting to maintain settings. Reboot to reset."
echo ""
sleep 0.5
echo ""
echo "THANKS FOR USING"
echo ""
sleep 0.5
echo ""
echo "█▓▒▒░░░THANKS FOR USING MODULE ░░░▒▒▓█"
echo ""
cmd notification post -S bigtext -t 'FPS UNLOCK by Agung Developer' 'Copyright Agung Developer' 'SUCCES ACTIVE.' >/dev/null 2>&1
