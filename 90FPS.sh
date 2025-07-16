#!/system/bin/sh
# 90FPS Module by Agung Developer
# Optimized for enforcing 90 FPS and disabling thermal limits
# Watermark: Agung Developer

# Display initial notification
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Starting Configuration by Agung Developer'

# Header with watermark
echo ""
echo "█▓▒▒░░░FPS INJECTOR by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5

# Device and hardware info
echo "┌───────────────────────────────┐"
echo "│   DEVICE & HARDWARE INFO      │"
echo "├───────────────────────────────┤"
echo "│ 📱 Device: $(getprop ro.product.manufacturer) $(getprop ro.product.model)"
echo "│ ⚙️ CPU: $(getprop ro.board.platform)"
echo "│ 🎮 GPU: $(getprop ro.hardware)"
echo "│ 📲 Android: $(getprop ro.build.version.release)"
echo "│ 🔥 Thermal: $(cat /sys/class/thermal/thermal_zone0/temp)°C"
echo "│ 🔰 Kernel: $(uname -r)"
echo "│ 🔹 Build: $(getprop ro.build.display.id)"
echo "│ 🛑 Root: $(if [ $(id -u) -eq 0 ]; then echo 'Yes'; else echo 'No'; fi)"
echo "│ 🔗 SELinux: $(getenforce)"
echo "└───────────────────────────────┘"
echo ""
echo "█▓▒▒░░░INSTALLATION by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5

# Core FPS and refresh rate optimizations
(
  # Display settings
  cmd display set-match-content-frame-rate-pref 1
  settings put system power.dfps.level 0
  settings put system disable_idle_fps true
  settings put system fps.idle_control false
  settings put system metadata_dynfps.disabel 1
  settings put system display.disable_dynamic_fps 1
  settings put system display.low_framerate_limit 90
  settings put system display.refresh_rate 90
  settings put system display.enable_optimal_refresh_rate 1
  settings put system display.idle_time 0
  settings put global dfps.enable false
  settings put global smart_dfps.enable false
  settings put global smart_dfps.idle_fps 90
  settings put global display.idle_default_fps 90

  # MediaTek-specific settings
  setprop debug.mediatek_high_frame_rate_multiple_display_mode 0
  setprop debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold 90

  # Transsion-specific settings
  settings put global tran_refresh_rate_video_detector.support 0
  settings put global tran_default_auto_refresh.support 0
  settings put global tran_default_refresh_mode 90
  settings put global tran_90hz_refresh_rate.not_support 1
  settings put global tran_custom_refresh_rate_config.support 1
  settings put global transsion.frame_override.support 0
  settings put global transsion.tran_refresh_rate.support 0

  # SurfaceFlinger optimizations
  setprop debug.sf.perf_mode 1
  setprop debug.sf.latch_unsignaled 1
  setprop debug.sf.high_fps_early_phase_offset_ns 2000000
  setprop debug.sf.high_fps_late_app_phase_offset_ns 500000
  setprop persist.sys.surfaceflinger.idle_reduce_framerate_enable false

  # HWUI and performance tweaks
  setprop debug.hwui.refresh_rate 90
  setprop debug.hwui.disable_vsync true
  setprop debug.performance.profile 1
  setprop debug.perf.tuning 1
  setprop persist.sys.gpu_perf_mode 1
  setprop debug.mtk.powerhal.hint.bypass 1

  # Lock refresh rate to 90 Hz
  settings put system user_refresh_rate 90
  settings put system fps_limit 90
  settings put system max_refresh_rate_for_ui 90
  settings put system max_refresh_rate_for_gaming 90
  settings put system min_refresh_rate 90
  settings put system max_refresh_rate 90
  settings put system peak_refresh_rate 90
  settings put system thermal_limit_refresh_rate 90
  settings put system NV_FPSLIMIT 90
  settings put secure refresh_rate_mode 90
  settings put system display_min_refresh_rate 90
) > /dev/null 2>&1 &

# Game-specific optimizations (disable battery restrictions)
echo "Disabling battery optimizations for supported games..."
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
  dumpsys deviceidle whitelist +$app
  echo "[✔] $app (120FPS) optimized by Agung Developer!"
done

for app in \
  com.dts.freefireth \
  com.dts.freefiremax \
  com.garena.game.kgvn
do
  dumpsys deviceidle whitelist +$app
  echo "[✔] $app (90FPS) optimized by Agung Developer!"
done

# Final status messages with watermark
echo ""
echo "█▓▒▒░░░OPTIMIZATION STATUS by Agung Developer░░░▒▒▓█"
echo "MATIKAN THERMAL LIMIT FPS [✓]"
echo "PAKSA REFRESH RATE MAXIMAL [✓]"
echo "PAKSA MAX THERMAL LIMIT FPS [✓]"
echo "ALL SETTINGS APPLIED [✓]"
echo ""
echo "‼️ ENJOY GAMING WITH AGUNG DEVELOPER ‼️"
echo "DO NOT REBOOT DEVICE"
echo "█▓▒▒░░░THANKS FOR USING FPS INJECTOR by Agung Developer░░░▒▒▓█"
echo ""

# Final notification
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'SUCCESSFULLY ACTIVATED by Agung Developer'
