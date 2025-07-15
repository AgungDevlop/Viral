#!/system/bin/sh
# FPS Injector Script
# Created by Agung Developer
# Optimized for high FPS and smooth gaming performance

# ANSI color codes for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Cool ASCII art header with credits
echo -e "${CYAN}"
cat << 'EOF'
=============================================
        FPS INJECTOR by Agung Developer
=============================================
   🚀 Unlocking High FPS for Ultimate Gaming 🚀
   Created by: Agung Developer
   Contact: https://agungdeveloper.com
   Donate: https://paypal.me/agungdeveloper
=============================================
EOF
echo -e "${NC}"

# Send initial notification
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Starting FPS Optimization... Created by Agung Developer' 2>/dev/null

# Function to check for root access
check_root() {
    if [ $(id -u) -eq 0 ]; then
        echo -e "${GREEN}[✔] Root Access: Detected${NC}"
        return 0
    else
        echo -e "${RED}[✘] Root Access: Not Detected${NC}"
        return 1
    fi
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Display device information
echo -e "${YELLOW}=== Device Information ===${NC}"
echo "Device: $(getprop ro.product.manufacturer 2>/dev/null || echo 'Unknown') $(getprop ro.product.model 2>/dev/null || echo 'Unknown')"
echo "CPU: $(getprop ro.board.platform 2>/dev/null || echo 'Unknown')"
echo "GPU: $(getprop ro.hardware.egl 2>/dev/null || getprop ro.hardware 2>/dev/null || echo 'Unknown')"
echo "Android Version: $(getprop ro.build.version.release 2>/dev/null || echo 'Unknown')"
echo "Thermal: $(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000 "°C"}' || echo 'Unknown')"
echo "Kernel: $(uname -r 2>/dev/null || echo 'Unknown')"
echo "Build: $(getprop ro.build.display.id 2>/dev/null || echo 'Unknown')"
check_root && ROOT_STATUS="Yes" || ROOT_STATUS="No"
echo "Root: $ROOT_STATUS"
echo "SELinux: $(getenforce 2>/dev/null || echo 'Unknown')"
echo -e "${YELLOW}=========================${NC}\n"

# Function to apply settings with error checking
apply_setting() {
    local cmd_type="$1"
    local key="$2"
    local value="$3"
    if [ "$cmd_type" = "settings" ]; then
        if command_exists settings; then
            settings put "$key" "$value" 2>/dev/null && echo -e "${GREEN}[✔] Set $key to $value${NC}" || echo -e "${RED}[✘] Failed to set $key${NC}"
        else
            echo -e "${RED}[✘] Settings command not available${NC}"
        fi
    elif [ "$cmd_type" = "setprop" ]; then
        if command_exists setprop; then
            setprop "$key" "$value" 2>/dev/null && echo -e "${GREEN}[✔] Set prop $key to $value${NC}" || echo -e "${RED}[✘] Failed to set prop $key${NC}"
        else
            echo -e "${RED}[✘] Setprop command not available${NC}"
        fi
    fi
}

# FPS and performance optimizations
echo -e "${CYAN}=== Applying FPS Optimizations ===${NC}"
(
    # Display and FPS settings
    apply_setting settings system power.dfps.level 0
    apply_setting settings system disable_idle_fps true
    apply_setting settings system disable_idle_fps.threshold 1
    apply_setting settings system fps.idle_control false
    apply_setting settings system metadata_dynfps.disabel 1
    apply_setting settings system enable_dpps_dynamic_fps 0
    apply_setting settings system display.disable_dynamic_fps 1
    apply_setting settings system display.disable_metadata_dynamic_fps 1
    apply_setting settings system display.low_framerate_limit 120
    apply_setting settings system display.defer_fps_frame_count 2
    apply_setting settings system display.refresh_rate 120
    apply_setting settings system display.large_comp_hint_fps 120
    apply_setting settings system display.enable_pref_hint_for_low_fps 1
    apply_setting settings system display.enable_optimal_refresh_rate 1
    apply_setting settings system display.enable_idle_content_fps_hint 0
    apply_setting settings system display.refresh_rate_changeable 0
    apply_setting settings system display.disable_mitigated_fps 1
    apply_setting settings system display.idle_time 0
    apply_setting settings system display.idle_time_inactive 0
    apply_setting settings global dfps.enable false
    apply_setting settings global smart_dfps.enable false
    apply_setting settings global fps.switch.thermal false
    apply_setting settings global fps.switch.default false
    apply_setting settings global smart_dfps.idle_fps 120
    apply_setting settings global display.idle_default_fps 120
    apply_setting settings global smart_dfps.app_switch_fps 120
    apply_setting settings global display.fod_monitor_default_fps 120

    # Device transmission settings
    apply_setting setprop debug.mediatek_high_frame_rate_multiple_display_mode 0
    apply_setting setprop debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold 120
    apply_setting settings global tran_refresh_rate_video_detector.support 0
    apply_setting settings global tran_default_auto_refresh.support 0
    apply_setting settings global tran_default_refresh_mode 120
    apply_setting settings global tran_low_battery_60hz_refresh_rate.support 0
    apply_setting settings global tran_90hz_refresh_rate.not_support 0
    apply_setting settings system surfaceflinger.idle_reduce_framerate_enable false
    apply_setting settings global tran_custom_refresh_rate_config.support 1
    apply_setting settings global transsion.frame_override.support 0
    apply_setting settings global transsion.tran_refresh_rate.support 0

    # FPS optimizations
    apply_setting setprop debug.sys.display.fps 120
    apply_setting setprop debug.sys.game.minfps 120
    apply_setting setprop debug.sys.game.maxfps 120
    apply_setting setprop debug.sys.min_refresh_rate 120
    apply_setting setprop debug.sys.max_refresh_rate 120
    apply_setting setprop debug.sys.peak_refresh_rate 120
    apply_setting setprop debug.sys.sf.fps 120
    apply_setting setprop debug.sys.smartfps 1
    apply_setting setprop debug.sys.vsync_optimization_enable false
    apply_setting setprop debug.sys.hwui.dyn_vsync 0
    apply_setting setprop debug.sys.vsync false
    apply_setting setprop debug.sys.hwui.fps_mode 1
    apply_setting setprop debug.sys.first.frame.accelerates true
    apply_setting setprop debug.sys.fps_unlock_allowed 120
    apply_setting setprop debug.sys.display.max_fps 120
    apply_setting setprop debug.sys.video.max.fps 120

    # Refresh rate optimizations
    apply_setting settings global refresh_rate_mode 1
    apply_setting settings global refresh_rate_switching_type 1
    apply_setting settings global refresh_rate_force_high 1
    apply_setting setprop debug.hwui.refresh_rate 120
    apply_setting setprop debug.sf.perf_mode 1
    apply_setting settings global surface_flinger.use_content_detection_for_refresh_rate false
    apply_setting settings global media.recorder-max-base-layer-fps 120
    apply_setting settings global vendor.fps.switch.default true
    apply_setting settings system vendor.disable_idle_fps true
    apply_setting settings global vendor.display.default_fps 120
    apply_setting settings system vendor.display.idle_default_fps 120
    apply_setting settings system vendor.display.enable_optimize_refresh 1
    apply_setting settings system vendor.display.video_or_camera_fps.support true
    apply_setting setprop debug.sf.set_idle_timer_ms 500
    apply_setting setprop debug.sf.latch_unsignaled 1
    apply_setting setprop debug.sf.high_fps_early_phase_offset_ns 2000000
    apply_setting setprop debug.sf.high_fps_late_app_phase_offset_ns 500000
    apply_setting settings system game_driver_min_frame_rate 120
    apply_setting settings system game_driver_max_frame_rate 120
    apply_setting settings system game_driver_power_saving_mode 0
    apply_setting settings system game_driver_frame_skip_enable 0
    apply_setting settings system game_driver_vsync_enable 0
    apply_setting settings system game_driver_gpu_mode 1
    apply_setting settings system game_driver_fps_limit 120

    # FPS Injector specific settings
    apply_setting setprop debug.graphics.game_default_frame_rate 120
    apply_setting setprop debug.graphics.game_default_frame_rate.disabled false
    apply_setting setprop persist.sys.gpu_perf_mode 1
    apply_setting setprop debug.mtk.powerhal.hint.bypass 1
    apply_setting setprop persist.sys.surfaceflinger.idle_reduce_framerate_enable false
    apply_setting setprop sys.surfaceflinger.idle_reduce_framerate_enable false
    apply_setting settings global refresh.active 1
    apply_setting setprop debug.hwui.disable_vsync true
    apply_setting setprop debug.performance.profile 1
    apply_setting setprop debug.performance.tuning 1

    # Lock FPS to 120 Hz
    apply_setting settings system user_refresh_rate 120
    apply_setting settings system fps_limit 120
    apply_setting settings system max_refresh_rate_for_ui 120
    apply_setting settings system hwui_refresh_rate 120
    apply_setting settings system display_refresh_rate 120
    apply_setting settings system max_refresh_rate_for_gaming 120
    apply_setting settings system fstb_target_fps_margin_high_fps 20
    apply_setting settings system fstb_target_fps_margin_low_fps 20
    apply_setting settings system gcc_fps_margin 10
    apply_setting settings system tran_low_battery_60hz_refresh_rate.support 0
    apply_setting settings system vendor.display.refresh_rate 120
    apply_setting settings secure user_refresh_rate 1
    apply_setting settings secure miui_refresh_rate 120
    apply_setting settings system min_frame_rate 120
    apply_setting settings system max_frame_rate 120
    apply_setting settings system tran_refresh_mode 120
    apply_setting settings system last_tran_refresh_mode_in_refresh_setting 120
    apply_setting settings global min_fps 120
    apply_setting settings global max_fps 120
    apply_setting settings system tran_need_recovery_refresh_mode 120
    apply_setting settings system display_min_refresh_rate 120
    apply_setting settings system min_refresh_rate 120
    apply_setting settings system max_refresh_rate 120
    apply_setting settings system peak_refresh_rate 120
    apply_setting settings secure refresh_rate_mode 120
    apply_setting settings system thermal_limit_refresh_rate 120
    apply_setting settings system NV_FPSLIMIT 120

    # Additional thermal and performance tweaks
    apply_setting setprop persist.sys.thermal.limit_fps 0
    apply_setting setprop debug.thermal.throttling.disable 1
    apply_setting setprop ro.vendor.perf.scrolling.fps 120
    apply_setting setprop ro.vendor.perf.game.mode 1
    apply_setting setprop debug.performance.gpu.boost 1
    apply_setting setprop debug.performance.cpu.boost 1
) > /dev/null 2>&1 &

# Disable battery optimization for games
echo -e "${CYAN}=== Disabling Battery Optimization for Games ===${NC}"
GAMES=(
    "com.netease.newspike:120FPS"
    "com.miHoYo.GenshinImpact:120FPS"
    "com.garena.game.codm:120FPS"
    "com.riotgames.league.wildrift:120FPS"
    "com.mobile.legends:120FPS"
    "com.tencent.ig:120FPS"
    "com.mobile.legends.hwag:120FPS"
    "com.mobile.legends.mi:120FPS"
    "com.garena.game.df:120FPS"
    "com.tencent.tmgp.sgame:120FPS"
    "com.roblox.client:120FPS"
    "com.dts.freefireth:90FPS"
    "com.dts.freefiremax:90FPS"
    "com.garena.game.kgvn:90FPS"
    "com.epicgames.fortnite:90FPS"
    "com.supercell.clashroyale:60FPS"
    "com.supercell.brawlstars:60FPS"
    "com.ea.games.apexlegends:90FPS"
)
for game in "${GAMES[@]}"; do
    pkg=${game%%:*}
    fps=${game##*:}
    if command_exists dumpsys; then
        dumpsys deviceidle whitelist +"$pkg" 2>/dev/null && echo -e "${GREEN}[✔] $pkg ($fps) not restricted${NC}" || echo -e "${RED}[✘] Failed to whitelist $pkg${NC}"
    else
        echo -e "${RED}[✘] Dumpsys command not available${NC}"
    fi
done

# Cool ASCII art footer with credits
echo -e "${CYAN}"
cat << 'EOF'
=============================================
        FPS INJECTOR by Agung Developer
=============================================
   ✅ Optimization Complete! Enjoy Gaming! ✅
   Created by: Agung Developer
   Follow: https://youtube.com/@agungdeveloper
   Support: https://paypal.me/agungdeveloper
=============================================
EOF
echo -e "${NC}"

# Send final notification
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'SUCCESS: FPS Optimization Complete! Created by Agung Developer' 2>/dev/null

# Log completion
echo -e "${GREEN}[✔] FPS Injector script executed successfully${NC}"
