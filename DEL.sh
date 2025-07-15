#!/system/bin/sh
# Module By Agung Developer

cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Starting Configuration.'
echo ""
echo "█▓▒▒░░░FPS INJECTOR░░░▒▒▓█"
echo ""
sleep 0.5
echo "DEVICE AND HARDWARE INFO"
sleep 0.5
echo "DEVICE $(getprop ro.product.brand)"
sleep 0.5
echo "MODEL $(getprop ro.product.model)"
sleep 0.5
echo "CPU $(getprop ro.hardware)"
sleep 0.5
echo "GPU $(getprop ro.hardware.egl)"
sleep 0.5
echo "SDK $(getprop ro.build.version.sdk)"
echo ""
echo "█▓▒▒░░░WELCOME TO UNINSTALL░░░▒▒▓█"
echo ""
sleep 0.5

# Reset FPS and Refresh Rate Settings
(
    settings delete system user_refresh_rate
    settings delete system min_refresh_rate
    settings delete system max_refresh_rate
    settings put system peak_refresh_rate 60
    settings delete system display_refresh_rate
    settings delete global refresh_rate_mode
    settings delete global refresh_rate_switching_type
    settings delete global refresh_rate_force_high
    setprop debug.hwui.refresh_rate ""
    setprop debug.sf.perf_mode ""
    settings delete global surface_flinger.use_content_detection_for_refresh_rate
    settings delete system game_driver_min_frame_rate
    settings delete system game_driver_max_frame_rate
    settings delete system game_driver_vsync_enable
    settings delete system game_driver_fps_limit
    settings delete system disable_idle_fps
    settings delete system display.disable_dynamic_fps
    settings delete system display.enable_optimal_refresh_rate
    setprop debug.sf.latch_unsignaled ""
    setprop debug.sf.high_fps_early_phase_offset_ns ""
    setprop debug.sf.high_fps_late_app_phase_offset_ns ""
    setprop debug.graphics.game_default_frame_rate ""
    setprop debug.graphics.game_default_frame_rate.disabled ""
    settings-put system thermal_limit_refresh_rate
) > /dev/null 2>&1 &

# Remove Battery Optimization Whitelist
echo "Menghapus whitelist optimalisasi baterai untuk game yang support 120 FPS dan 90 FPS"
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
    dumpsys deviceidle whitelist -$app 2>/dev/null && echo "[✔] $app (120FPS) telah dikembalikan ke pengaturan default sistem."
done
for app in \
    com.dts.freefireth \
    com.dts.freefiremax \
    com.garena.game.kgvn
do
    dumpsys deviceidle whitelist -$app 2>/dev/null && echo "[✔] $app (90FPS) telah dikembalikan ke pengaturan default sistem."
done
echo ""
sleep 0.5
echo "DELETE ALL STRING [✓]"
echo ""
sleep 0.5
echo "‼️REBOOT DEVICE ‼️"
echo ""
sleep 0.5
echo "Module By Agung Developer"
echo ""
sleep 0.5
echo "DONE UNINSTALL"
echo ""
sleep 0.5
echo "█▓▒▒░░░THANKS FOR USING MODULE ░░░▒▒▓█"
echo ""
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'SUCCESS DELETE.'
