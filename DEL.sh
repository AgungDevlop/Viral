#!/system/bin/sh
# Module By Agung Developer
# FPS Injector Uninstall - Restore default device settings
# Created by Agung Developer (https://agungdeveloper.com)

# ANSI color codes for terminal output
RED="\033[0;31m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Display header
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Starting Uninstallation.'
echo -e "${CYAN}█▓▒▒░░░ FPS INJECTOR UNINSTALL by Agung Developer ░░░▒▒▓█${RESET}"
echo ""
sleep 0.5

# Device Information
echo -e "${YELLOW}DEVICE AND HARDWARE INFO${RESET}"
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo -e "${GREEN}📱 Device :$(getprop ro.product.brand) $(getprop ro.product.model)${RESET}"
sleep 0.2
echo -e "${GREEN}⚙️ CPU    :$(getprop ro.hardware)${RESET}"
sleep 0.2
echo -e "${GREEN}🎮 GPU    :$(getprop ro.hardware.egl)${RESET}"
sleep 0.2
echo -e "${GREEN}📲 SDK    :$(getprop ro.build.version.sdk)${RESET}"
sleep 0.2
echo -e "${GREEN}🔥 Thermal:${CYAN}$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null || echo 'N/A')${RESET}°C"
sleep 0.2
echo -e "${GREEN}🔰 Kernel :$(uname -r)${RESET}"
sleep 0.2
echo -e "${GREEN}🔹 Build  :$(getprop ro.build.display.id)${RESET}"
sleep 0.2
echo -e "${GREEN}🛑 Root   :$(if [ $(id -u) -eq 0 ]; then echo 'Yes'; else echo 'No'; fi)${RESET}"
sleep 0.2
echo -e "${GREEN}🔗 SELinux:$(getenforce)${RESET}"
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo ""
echo -e "${CYAN}█▓▒▒░░░ WELCOME TO UNINSTALLATION ░░░▒▒▓█${RESET}"
echo ""
sleep 0.5

# Reset FPS and Refresh Rate Settings
echo -e "${YELLOW}Resetting FPS and refresh rate settings...${RESET}"
(
    # Check and reset standard settings
    settings get system user_refresh_rate >/dev/null 2>&1 && settings put system user_refresh_rate 0
    settings get system min_refresh_rate >/dev/null 2>&1 && settings put system min_refresh_rate 0
    settings get system max_refresh_rate >/dev/null 2>&1 && settings put system max_refresh_rate 0
    settings get system peak_refresh_rate >/dev/null 2>&1 && settings put system peak_refresh_rate 60
    settings get system display_refresh_rate >/dev/null 2>&1 && settings put system display_refresh_rate 0
    settings get global refresh_rate_mode >/dev/null 2>&1 && settings put global refresh_rate_mode 0
    settings get global refresh_rate_switching_type >/dev/null 2>&1 && settings put global refresh_rate_switching_type 0
    settings get global refresh_rate_force_high >/dev/null 2>&1 && settings put global refresh_rate_force_high 0
    settings get global surface_flinger.use_content_detection_for_refresh_rate >/dev/null 2>&1 && settings put global surface_flinger.use_content_detection_for_refresh_rate true
    settings get system game_driver_min_frame_rate >/dev/null 2>&1 && settings put system game_driver_min_frame_rate 0
    settings get system game_driver_max_frame_rate >/dev/null 2>&1 && settings put system game_driver_max_frame_rate 0
    settings get system天地游戏优化器_帧率限制 >/dev/null 2>&1 && settings put system game_driver_fps_limit 0
    settings get system disable_idle_fps >/dev/null 2>&1 && settings put system disable_idle_fps false
    settings get system display.disable_dynamic_fps >/dev/null 2>&1 && settings put system display.disable_dynamic_fps 0
    settings get system display.enable_optimal_refresh_rate >/dev/null 2>&1 && settings put system display.enable_optimal_refresh_rate 0
    settings get system thermal_limit_refresh_rate >/dev/null 2>&1 && settings put system thermal_limit_refresh_rate 0

    # Reset debug properties
    setprop debug.hwui.refresh_rate ""
    setprop debug.sf.perf_mode ""
    setprop debug.sf.latch_unsignaled ""
    setprop debug.sf.high_fps_early_phase_offset_ns ""
    setprop debug.sf.high_fps_late_app_phase_offset_ns ""
    setprop debug.graphics.game_default_frame_rate ""
    setprop debug.graphics.game_default_frame_rate.disabled ""
) > /dev/null 2>&1 && echo -e "${GREEN}[✔] Display settings restored to default${RESET}" || echo -e "${RED}[✗] Failed to reset some display settings${RESET}"

# Remove Battery Optimization Whitelist
echo -e "${YELLOW}Restoring battery optimization for games...${RESET}"
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
    dumpsys deviceidle whitelist -$app 2>/dev/null && echo -e "${GREEN}[✔] $app (120FPS) restored to default${RESET}" || echo -e "${RED}[✗] Failed to restore $app (120FPS)${RESET}"
    sleep 0.1
done
for app in \
    com.dts.freefireth \
    com.dts.freefiremax \
    com.garena.game.kgvn
do
    dumpsys deviceidle whitelist -$app 2>/dev/null && echo -e "${GREEN}[✔] $app (90FPS) restored to default${RESET}" || echo -e "${RED}[✗] Failed to restore $app (90FPS)${RESET}"
    sleep 0.1
done

# Final Output
echo ""
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo -e "${GREEN}[✓] All Settings Removed${RESET}"
sleep 0.5
echo -e "${YELLOW}‼️ PLEASE REBOOT DEVICE TO APPLY CHANGES ‼️${RESET}"
echo ""
sleep 0.5
echo -e "${CYAN}Module By Agung Developer${RESET}"
echo -e "${CYAN}Visit: https://agungdeveloper.com${RESET}"
echo ""
sleep 0.5
echo -e "${CYAN}█▓▒▒░░░ UNINSTALLATION COMPLETE ░░░▒▒▓█${RESET}"
echo ""
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'SUCCESSFULLY UNINSTALLED.'
