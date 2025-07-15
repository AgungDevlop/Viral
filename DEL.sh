#!/system/bin/sh
# FPS Injector Cleanup Script
# Created by Agung Developer
# Resets FPS and performance optimizations for a clean state

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
      FPS INJECTOR CLEANUP by Agung Developer
=============================================
   🧹 Resetting FPS & Performance Settings 🧹
   Created by: Agung Developer
   Contact: https://agungdeveloper.com
   Donate: https://paypal.me/agungdeveloper
=============================================
EOF
echo -e "${NC}"

# Send initial notification with icon
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Starting Cleanup... Created by Agung Developer' --icon com.fps.injector:drawable/ic_launcher 2>/dev/null

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
echo "Brand: $(getprop ro.product.brand 2>/dev/null || echo 'Unknown')"
echo "Model: $(getprop ro.product.model 2>/dev/null || echo 'Unknown')"
echo "CPU: $(getprop ro.hardware 2>/dev/null || echo 'Unknown')"
echo "GPU: $(getprop ro.hardware.egl 2>/dev/null || getprop ro.hardware 2>/dev/null || echo 'Unknown')"
echo "SDK: $(getprop ro.build.version.sdk 2>/dev/null || echo 'Unknown')"
check_root && ROOT_STATUS="Yes" || ROOT_STATUS="No"
echo "Root: $ROOT_STATUS"
echo "SELinux: $(getenforce 2>/dev/null || echo 'Unknown')"
echo -e "${YELLOW}=========================${NC}\n"

# Function to reset settings with error checking
reset_setting() {
    local cmd_type="$1"
    local key="$2"
    if [ "$cmd_type" = "settings" ]; then
        if command_exists settings; then
            settings delete "$key" 2>/dev/null && echo -e "${GREEN}[✔] Deleted $key${NC}" || echo -e "${RED}[✘] Failed to delete $key${NC}"
        else
            echo -e "${RED}[✘] Settings command not available${NC}"
        fi
    elif [ "$cmd_type" = "resetprop" ]; then
        if command_exists resetprop; then
            resetprop "$key" 2>/dev/null && echo -e "${GREEN}[✔] Reset prop $key${NC}" || echo -e "${RED}[✘] Failed to reset prop $key${NC}"
        else
            echo -e "${RED}[✘] Resetprop command not available${NC}"
        fi
    fi
}

# Reset FPS and performance settings
echo -e "${CYAN}=== Resetting FPS & Display Settings ===${NC}"
(
    # Display and FPS settings
    if command_exists cmd; then
        cmd display set-match-content-frame-rate-pref 0 2>/dev/null && echo -e "${GREEN}[✔] Reset display match content frame rate${NC}" || echo -e "${RED}[✘] Failed to reset display match content${NC}"
    fi
    reset_setting settings system power.dfps.level
    reset_setting settings system disable_idle_fps
    reset_setting settings system disable_idle_fps.threshold
    reset_setting settings system fps.idle_control
    reset_setting settings system metadata_dynfps.disabel
    reset_setting settings system enable_dpps_dynamic_fps
    reset_setting settings system display.disable_dynamic_fps
    reset_setting settings system display.disable_metadata_dynamic_fps
    reset_setting settings system display.low_framerate_limit
    reset_setting settings system display.defer_fps_frame_count
    reset_setting settings system display.refresh_rate
    reset_setting settings system display.large_comp_hint_fps
    reset_setting settings system display.enable_pref_hint_for_low_fps
    reset_setting settings system display.enable_optimal_refresh_rate
    reset_setting settings system display.enable_idle_content_fps_hint
    reset_setting settings system display.refresh_rate_changeable
    reset_setting settings system display.disable_mitigated_fps
    reset_setting settings system display.idle_time
    reset_setting settings system display.idle_time_inactive
    reset_setting settings global dfps.enable
    reset_setting settings global smart_dfps.enable
    reset_setting settings global fps.switch.thermal
    reset_setting settings global fps.switch.default
    reset_setting settings global smart_dfps.idle_fps
    reset_setting settings global display.idle_default_fps
    reset_setting settings global smart_dfps.app_switch_fps
    reset_setting settings global display.fod_monitor_default_fps

    # Device transmission settings
    reset_setting resetprop debug.mediatek_high_frame_rate_multiple_display_mode
    reset_setting resetprop debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold
    reset_setting settings global tran_refresh_rate_video_detector.support
    reset_setting settings global tran_default_auto_refresh.support
    reset_setting settings global tran_default_refresh_mode
    reset_setting settings global tran_low_battery_60hz_refresh_rate.support
    reset_setting settings global tran_90hz_refresh_rate.not_support
    reset_setting settings system surfaceflinger.idle_reduce_framerate_enable
    reset_setting settings global tran_custom_refresh_rate_config.support
    reset_setting settings global transsion.frame_override.support
    reset_setting settings global transsion.tran_refresh_rate.support

    # System FPS settings
    reset_setting resetprop debug.sys.display.fps
    reset_setting resetprop debug.sys.game.minfps
    reset_setting resetprop debug.sys.game.maxfps
    reset_setting resetprop debug.sys.min_refresh_rate
    reset_setting resetprop debug.sys.max_refresh_rate
    reset_setting resetprop debug.sys.peak_refresh_rate
    reset_setting resetprop debug.sys.sf.fps
    reset_setting resetprop debug.sys.smartfps
    reset_setting resetprop debug.sys.vsync_optimization_enable
    reset_setting resetprop debug.sys.hwui.dyn_vsync
    reset_setting resetprop debug.sys.vsync
    reset_setting resetprop debug.sys.hwui.fps_mode
    reset_setting resetprop debug.sys.first.frame.accelerates
    reset_setting resetprop debug.sys.fps_unlock_allowed
    reset_setting resetprop debug.sys.display.max_fps
    reset_setting resetprop debug.sys.video.max.fps
    reset_setting resetprop sys.display.fps
    reset_setting resetprop sys.display_refresh_rate
    reset_setting resetprop sys.game.minfps
    reset_setting resetprop sys.game.maxfps
    reset_setting resetprop sys.game.minframerate
    reset_setting resetprop sys.game.maxframerate
    reset_setting resetprop sys.min_refresh_rate
    reset_setting resetprop sys.max_refresh_rate
    reset_setting resetprop sys.peak_refresh_rate
    reset_setting resetprop sys.sf.fps
    reset_setting resetprop sys.smartfps
    reset_setting resetprop sys.display.min_refresh_rate
    reset_setting resetprop sys.vsync_optimization_enable
    reset_setting resetprop sys.hwui.dyn_vsync
    reset_setting resetprop sys.vsync
    reset_setting resetprop sys.hwui.fps_mode
    reset_setting resetprop sys.first.frame.accelerates
    reset_setting resetprop sys.fps_unlock_allowed
    reset_setting resetprop sys.display.max_fps
    reset_setting resetprop sys.video.max.fps
    reset_setting resetprop sys.surfaceflinger.idle_reduce_framerate_enable

    # Refresh rate and FPS injector settings
    reset_setting settings global refresh_rate_mode
    reset_setting settings global refresh_rate_switching_type
    reset_setting settings global refresh_rate_force_high
    reset_setting resetprop debug.hwui.refresh_rate
    reset_setting resetprop debug.sf.perf_mode
    reset_setting settings global surface_flinger.use_content_detection_for_refresh_rate
    reset_setting settings global media.recorder-max-base-layer-fps
    reset_setting settings global vendor.fps.switch.default
    reset_setting settings system vendor.disable_idle_fps
    reset_setting settings system vendor.display.default_fps
    reset_setting settings system vendor.display.idle_default_fps
    reset_setting settings system vendor.display.enable_optimize_refresh
    reset_setting settings system vendor.display.video_or_camera_fps.support
    reset_setting settings system game_driver_min_frame_rate
    reset_setting settings system game_driver_max_frame_rate
    reset_setting settings system game_driver_power_saving_mode
    reset_setting settings system game_driver_frame_skip_enable
    reset_setting settings system game_driver_vsync_enable
    reset_setting settings system game_driver_gpu_mode
    reset_setting settings system game_driver_fps_limit
    reset_setting resetprop debug.sf.set_idle_timer_ms
    reset_setting resetprop debug.sf.latch_unsignaled
    reset_setting resetprop debug.sf.high_fps_early_phase_offset_ns
    reset_setting resetprop debug.sf.high_fps_late_app_phase_offset_ns
    reset_setting resetprop debug.graphics.game_default_frame_rate
    reset_setting resetprop debug.graphics.game_default_frame_rate.disabled
    reset_setting resetprop persist.sys.gpu_perf_mode
    reset_setting resetprop debug.mtk.powerhal.hint.bypass
    reset_setting resetprop persist.sys.surfaceflinger.idle_reduce_framerate_enable
    reset_setting resetprop sys.surfaceflinger.idle_reduce_framerate_enable
    reset_setting resetprop debug.hwui.disable_vsync
    reset_setting resetprop debug.performance.profile
    reset_setting resetprop debug.perf.tuning

    # Additional FPS settings
    reset_setting settings system user_refresh_rate
    reset_setting settings system fps_limit
    reset_setting settings system max_refresh_rate_for_ui
    reset_setting settings system hwui_refresh_rate
    reset_setting settings system display_refresh_rate
    reset_setting settings system max_refresh_rate_for_gaming
    reset_setting settings system fstb_target_fps_margin_high_fps
    reset_setting settings system fstb_target_fps_margin_low_fps
    reset_setting settings system gcc_fps_margin
    reset_setting settings system tran_low_battery_60hz_refresh_rate.support
    reset_setting settings system vendor.display.refresh_rate
    reset_setting settings secure user_refresh_rate
    reset_setting settings secure miui_refresh_rate
    reset_setting settings system min_frame_rate
    reset_setting settings system max_frame_rate
    reset_setting settings system tran_refresh_mode
    reset_setting settings system last_tran_refresh_mode_in_refresh_setting
    reset_setting settings global min_fps
    reset_setting settings global max_fps
    reset_setting settings system tran_need_recovery_refresh_mode
    reset_setting settings system display_min_refresh_rate
    reset_setting settings system min_refresh_rate
    reset_setting settings system max_refresh_rate
    reset_setting settings system peak_refresh_rate
    reset_setting settings secure refresh_rate_mode
    reset_setting settings system thermal_limit_refresh_rate
    reset_setting settings system NV_FPSLIMIT

    # Additional thermal and performance resets
    reset_setting resetprop persist.sys.thermal.limit_fps
    reset_setting resetprop debug.thermal.throttling.disable
    reset_setting resetprop ro.vendor.perf.scrolling.fps
    reset_setting resetprop ro.vendor.perf.game.mode
    reset_setting resetprop debug.performance.gpu.boost
    reset_setting resetprop debug.performance.cpu.boost
) > /dev/null 2>&1 &

# Remove battery optimization whitelist for games
echo -e "${CYAN}=== Removing Battery Optimization Whitelist ===${NC}"
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
        dumpsys deviceidle whitelist -"$pkg" 2>/dev/null && echo -e "${GREEN}[✔] $pkg ($fps) restored to system default${NC}" || echo -e "${RED}[✘] Failed to remove whitelist for $pkg${NC}"
    else
        echo -e "${RED}[✘] Dumpsys command not available${NC}"
    fi
done

# Cool ASCII art footer with credits
echo -e "${CYAN}"
cat << 'EOF'
=============================================
      FPS INJECTOR CLEANUP by Agung Developer
=============================================
   ✅ Cleanup Complete! Please Reboot Device ✅
   Created by: Agung Developer
   Follow: https://youtube.com/@agungdeveloper
   Support: https://paypal.me/agungdeveloper
=============================================
EOF
echo -e "${NC}"

# Send final notification with icon
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Cleanup Successful! Please reboot device. Created by Agung Developer' --icon com.fps.injector:drawable/ic_launcher 2>/dev/null

# Log completion
echo -e "${GREEN}[✔] FPS Injector Cleanup script executed successfully${NC}"
echo -e "${YELLOW}⚠️ Please reboot your device to apply changes ⚠️${NC}"
