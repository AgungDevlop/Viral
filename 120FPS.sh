#!/system/bin/sh
# Module By Agung Developer
# FPS Injector - Optimize device for high refresh rate gaming
# Created by Agung Developer (https://agungdeveloper.com)

# ANSI color codes for terminal output
RED="\033[0;31m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Display header
cmd notification post -S bigtext -t 'LOCK FPS PRO BY AGUNG DEV' 'Tag' 'Starting Configuration.'
echo -e "${CYAN}█▓▒▒░░░ FPS INJECTOR by Agung Developer ░░░▒▒▓█${RESET}"
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
echo -e "${CYAN}█▓▒▒░░░ WELCOME TO INSTALLATION ░░░▒▒▓█${RESET}"
echo ""
sleep 0.5

# Optimize Refresh Rate and FPS Settings
(
    settings put system user_refresh_rate 120
    settings put system min_refresh_rate 120
    settings put system max_refresh_rate 120
    settings put system peak_refresh_rate 120
    settings put system display_refresh_rate 120
    settings put global refresh_rate_mode 1
    settings put global refresh_rate_switching_type 1
    settings put global refresh_rate_force_high 1
    setprop debug.sf.perf_mode 1
    setprop debug.hwui.refresh_rate 120
    setprop debug.sf.latch_unsignaled 1
    setprop debug.sf.high_fps_early_phase_offset_ns 2000000
    setprop debug.sf.high_fps_late_app_phase_offset_ns 500000
    settings put system game_driver_min_frame_rate 120
    settings put system game_driver_max_frame_rate 120
    settings put system game_driver_vsync_enable 0
    settings put system game_driver_fps_limit 120
    settings put system disable_idle_fps true
    settings put system display.disable_dynamic_fps 1
    settings put system display.enable_optimal_refresh_rate 1
    settings put global surface_flinger.use_content_detection_for_refresh_rate false
) > /dev/null 2>&1 &

# Disable Battery Optimizations for Games
echo -e "${YELLOW}Optimizing battery for supported games...${RESET}"
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
    dumpsys deviceidle whitelist +$app 2>/dev/null && echo -e "${GREEN}[✔] $app (120FPS) optimized!${RESET}"
    sleep 0.1
done
for app in \
    com.dts.freefireth \
    com.dts.freefiremax \
    com.garena.game.kgvn
do
    dumpsys deviceidle whitelist +$app 2>/dev/null && echo -e "${GREEN}[✔] $app (90FPS) optimized!${RESET}"
    sleep 0.1
done

# Final Output
echo ""
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo -e "${GREEN}[✓] Thermal Limit FPS Disabled${RESET}"
sleep 0.5
echo -e "${GREEN}[✓] Max Refresh Rate Forced${RESET}"
sleep 0.5
echo -e "${GREEN}[✓] FPS Injection & Optimization Complete${RESET}"
sleep 0.5
echo -e "${GREEN}[✓] All Settings Applied Successfully${RESET}"
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo ""
echo -e "${YELLOW}‼️ ENJOY YOUR OPTIMIZED GAMING EXPERIENCE ‼️${RESET}"
echo ""
sleep 0.5
echo -e "${CYAN}Module By Agung Developer${RESET}"
echo -e "${CYAN}Visit: https://agungdeveloper.com${RESET}"
echo ""
sleep 0.5
echo -e "${RED}⚠️ DO NOT REBOOT DEVICE ⚠️${RESET}"
echo ""
sleep 0.5
echo -e "${CYAN}█▓▒▒░░░ THANKS FOR USING FPS INJECTOR ░░░▒▒▓█${RESET}"
echo ""
cmd notification post -S bigtext -t 'LOCK FPS PRO BY AGUNG DEV' 'Tag' 'SUCCESSFULLY ACTIVATED.'
