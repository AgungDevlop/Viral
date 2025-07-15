#!/system/bin/sh
# Module By Agung Developer

cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Starting Configuration.'
echo ""
echo "█▓▒▒░░░FPS INJECTOR░░░▒▒▓█"
echo ""
sleep 0.5
echo "┌───────────────────────────────────────┐"
echo "│         DEVICE AND HARDWARE INFO      │"
echo "├───────────────────────────────────────┤"
echo "│ 📱 Device   : $(getprop ro.product.manufacturer) $(getprop ro.product.model) │"
echo "│ ⚙️ CPU      : $(getprop ro.board.platform) │"
echo "│ 🎮 GPU      : $(getprop ro.hardware) │"
echo "│ 📲 Android  : $(getprop ro.build.version.release) │"
echo "│ 🔥 Thermal  : $(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null || echo 'N/A')°C │"
echo "│ 🔰 Kernel   : $(uname -r) │"
echo "│ 🔹 Build    : $(getprop ro.build.display.id) │"
echo "│ 🛑 Root     : $(if [ $(id -u) -eq 0 ]; then echo 'Yes'; else echo 'No'; fi) │"
echo "│ 🔗 SELinux  : $(getenforce) │"
echo "└───────────────────────────────────────┘"
echo ""
echo "█▓▒▒░░░WELCOME TO INSTALASI░░░▒▒▓█"
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
echo "Menonaktifkan optimalisasi baterai untuk game yang support 120 FPS dan 90 FPS"
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
    dumpsys deviceidle whitelist +$app 2>/dev/null && echo "[✔] $app (120FPS) tidak dibatasi oleh sistem!"
done
for app in \
    com.dts.freefireth \
    com.dts.freefiremax \
    com.garena.game.kgvn
do
    dumpsys deviceidle whitelist +$app 2>/dev/null && echo "[✔] $app (90FPS) tidak dibatasi oleh sistem!"
done
echo ""
echo "MATIKAN THERMAL LIMIT FPS  [✓]"
echo ""
sleep 0.5
echo "PAKSA REFRESH RATE MAXIMAL [✓]"
sleep 0.5
echo "INJECT FPS & FPS OPTIMIZE  [✓]"
echo ""
sleep 0.5
echo "ALL DONE SET [✓]"
echo ""
sleep 0.5
echo "‼️SELAMAT MENIKMATI ‼️"
echo ""
sleep 0.5
echo "Module By Agung Developer"
echo ""
sleep 0.5
echo "DONT REBOOT"
echo ""
sleep 0.5
echo "THANKS FOR USING"
echo ""
sleep 0.5
echo "█▓▒▒░░░THANKS FOR USING MODULE ░░░▒▒▓█"
echo ""
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'SUCCES ACTIVE.'
