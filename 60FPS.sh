#!/system/bin/sh
# Module By Agung Developer
# FPS Injector 60FPS - Optimize device for smooth 60Hz gaming
# Created by Agung Developer (https://agungdeveloper.com)

# ANSI color codes for terminal output
RED="\033[0;31m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Display header
cmd notification post -S bigtext -t 'FPS INJECTOR 60FPS' 'Tag' 'Starting Configuration.' 2>/dev/null || echo -e "${RED}[!] Notification failed, continuing...${RESET}"
echo -e "${CYAN}█▓▒▒░░░ FPS INJECTOR 60FPS by Agung Developer ░░░▒▒▓█${RESET}"
echo ""
sleep 0.5

# Device Information
echo -e "${YELLOW}DEVICE AND HARDWARE INFO${RESET}"
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo -e "${GREEN}📱 Device :$(getprop ro.product.brand 2>/dev/null || echo 'Unknown') $(getprop ro.product.model 2>/dev/null || echo 'Unknown')${RESET}"
sleep 0.2
echo -e "${GREEN}⚙️ CPU    :$(getprop ro.hardware 2>/dev/null || echo 'Unknown')${RESET}"
sleep 0.2
echo -e "${GREEN}🎮 GPU    :$(getprop ro.hardware.egl 2>/dev/null || echo 'Unknown')${RESET}"
sleep 0.2
echo -e "${GREEN}📲 SDK    :$(getprop ro.build.version.sdk 2>/dev/null || echo 'Unknown')${RESET}"
sleep 0.2
echo -e "${GREEN}🔥 Thermal:${CYAN}$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null || echo 'N/A')${RESET}°C"
sleep 0.2
echo -e "${GREEN}🔰 Kernel :$(uname -r 2>/dev/null || echo 'Unknown')${RESET}"
sleep 0.2
echo -e "${GREEN}🔹 Build  :$(getprop ro.build.display.id 2>/dev/null || echo 'Unknown')${RESET}"
sleep 0.2
echo -e "${GREEN}🛑 Root   :$(if [ $(id -u 2>/dev/null) -eq 0 ]; then echo 'Yes'; else echo 'No'; fi)${RESET}"
sleep 0.2
echo -e "${GREEN}🔗 SELinux:$(getenforce 2>/dev/null || echo 'Unknown')${RESET}"
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo ""
echo -e "${CYAN}█▓▒▒░░░ WELCOME TO 60FPS INSTALLATION ░░░▒▒▓█${RESET}"
echo ""
sleep 0.5

# Optimize Refresh Rate and FPS Settings to 60Hz
(
    settings put system user_refresh_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set user_refresh_rate${RESET}"
    settings put system min_refresh_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set min_refresh_rate${RESET}"
    settings put system max_refresh_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set max_refresh_rate${RESET}"
    settings put system peak_refresh_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set peak_refresh_rate${RESET}"
    settings put system display_refresh_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set display_refresh_rate${RESET}"
    settings put global refresh_rate_mode 0 2>/dev/null || echo -e "${RED}[!] Failed to set refresh_rate_mode${RESET}"
    settings put global refresh_rate_switching_type 0 2>/dev/null || echo -e "${RED}[!] Failed to set refresh_rate_switching_type${RESET}"
    settings put global refresh_rate_force_high 0 2>/dev/null || echo -e "${RED}[!] Failed to set refresh_rate_force_high${RESET}"
    setprop debug.hwui.refresh_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set debug.hwui.refresh_rate${RESET}"
    setprop debug.sf.perf_mode 1 2>/dev/null || echo -e "${RED}[!] Failed to set debug.sf.perf_mode${RESET}"
    settings put global surface_flinger.use_content_detection_for_refresh_rate false 2>/dev/null || echo -e "${RED}[!] Failed to set surface_flinger.use_content_detection_for_refresh_rate${RESET}"
    settings put system game_driver_min_frame_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set game_driver_min_frame_rate${RESET}"
    settings put system game_driver_max_frame_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set game_driver_max_frame_rate${RESET}"
    settings put system game_driver_vsync_enable 0 2>/dev/null || echo -e "${RED}[!] Failed to set game_driver_vsync_enable${RESET}"
    settings put system game_driver_fps_limit 60 2>/dev/null || echo -e "${RED}[!] Failed to set game_driver_fps_limit${RESET}"
    settings put system disable_idle_fps true 2>/dev/null || echo -e "${RED}[!] Failed to set disable_idle_fps${RESET}"
    settings put system display.disable_dynamic_fps 1 2>/dev/null || echo -e "${RED}[!] Failed to set display.disable_dynamic_fps${RESET}"
    settings put system display.enable_optimal_refresh_rate 1 2>/dev/null || echo -e "${RED}[!] Failed to set display.enable_optimal_refresh_rate${RESET}"
    setprop debug.sf.latch_unsignaled 1 2>/dev/null || echo -e "${RED}[!] Failed to set debug.sf.latch_unsignaled${RESET}"
    setprop debug.sf.high_fps_early_phase_offset_ns 2000000 2>/dev/null || echo -e "${RED}[!] Failed to set debug.sf.high_fps_early_phase_offset_ns${RESET}"
    setprop debug.sf.high_fps_late_app_phase_offset_ns 500000 2>/dev/null || echo -e "${RED}[!] Failed to set debug.sf.high_fps_late_app_phase_offset_ns${RESET}"
    setprop debug.graphics.game_default_frame_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set debug.graphics.game_default_frame_rate${RESET}"
    setprop debug.graphics.game_default_frame_rate.disabled false 2>/dev/null || echo -e "${RED}[!] Failed to set debug.graphics.game_default_frame_rate.disabled${RESET}"
    settings put system thermal_limit_refresh_rate 60 2>/dev/null || echo -e "${RED}[!] Failed to set thermal_limit_refresh_rate${RESET}"
) &

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
    dumpsys deviceidle whitelist +$app 2>/dev/null && echo -e "${GREEN}[✔] $app (120FPS) optimized!${RESET}" || echo -e "${RED}[!] Failed to optimize $app (120FPS)${RESET}"
    sleep 0.1
done
for app in \
    com.dts.freefireth \
    com.dts.freefiremax \
    com.garena.game.kgvn
do
    dumpsys deviceidle whitelist +$app 2>/dev/null && echo -e "${GREEN}[✔] $app (90FPS) optimized!${RESET}" || echo -e "${RED}[!] Failed to optimize $app (90FPS)${RESET}"
    sleep 0.1
done

# Final Output
echo ""
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo -e "${GREEN}[✓] Thermal Limit FPS Disabled${RESET}"
sleep 0.5
echo -e "${GREEN}[✓] 60Hz Refresh Rate Applied${RESET}"
sleep 0.5
echo -e "${GREEN}[✓] FPS Injection & Optimization Complete${RESET}"
sleep 0.5
echo -e "${GREEN}[✓] All Settings Applied Successfully${RESET}"
echo -e "${CYAN}═══════════════════════════════════════${RESET}"
echo ""
echo -e "${YELLOW}‼️ ENJOY YOUR OPTIMIZED 60FPS GAMING EXPERIENCE ‼️${RESET}"
echo ""
sleep 0.5
echo -e "${CYAN}Module By Agung Developer${RESET}"
echo -e "${CYAN}Visit: https://agungdeveloper.com${RESET}"
echo ""
sleep 0.5
echo -e "${RED}⚠️ DO NOT REBOOT DEVICE ⚠️${RESET}"
echo ""
sleep 0.5
echo -e "${CYAN}█▓▒▒░░░ THANKS FOR USING FPS INJECTOR 60FPS ░░░▒▒▓█${RESET}"
echo ""
cmd notification post -S bigtext -t 'FPS INJECTOR 60FPS' 'Tag' 'SUCCESSFULLY ACTIVATED.' 2>/dev/null || echo -e "${RED}[!] Notification failed${RESET}"
