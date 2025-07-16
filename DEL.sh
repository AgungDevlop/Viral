#!/system/bin/sh
# DEL Script by Agung Developer
# Resets FPS Injector settings to default
# Watermark: Agung Developer

# Display initial notification
cmd notification post -S bigtext -t 'FPS INJECTOR RESET' 'Tag' 'Starting Reset Configuration by Agung Developer'

# Header with watermark
echo ""
echo "█▓▒▒░░░FPS RESET by Agung Developer░░░▒▒▓█"
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
echo "█▓▒▒░░░RESETTING SETTINGS by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5

# Reset FPS and refresh rate settings
(
  # Reset display settings
  settings reset system power.dfps.level
  settings reset system disable_idle_fps
  settings reset system fps.idle_control
  settings reset system metadata_dynfps.disabel
  settings reset system display.disable_dynamic_fps
  settings reset system display.low_framerate_limit
  settings reset system display.refresh_rate
  settings reset system display.enable_optimal_refresh_rate
  settings reset system display.idle_time
  settings reset global dfps.enable
  settings reset global smart_dfps.enable
  settings reset global smart_dfps.idle_fps
  settings reset global display.idle_default_fps

  # Reset MediaTek-specific settings
  setprop debug.mediatek_high_frame_rate_multiple_display_mode ""
  setprop debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold ""

  # Reset Transsion-specific settings
  settings reset global tran_refresh_rate_video_detector.support
  settings reset global tran_default_auto_refresh.support
  settings reset global tran_default_refresh_mode
  settings reset global tran_60hz_refresh_rate.not_support
  settings reset global tran_90hz_refresh_rate.not_support
  settings reset global tran_120hz_refresh_rate.not_support
  settings reset global tran_144hz_refresh_rate.not_support
  settings reset global tran_240hz_refresh_rate.not_support
  settings reset global tran_custom_refresh_rate_config.support
  settings reset global transsion.frame_override.support
  settings reset global transsion.tran_refresh_rate.support

  # Reset SurfaceFlinger settings
  setprop debug.sf.perf_mode 0
  setprop debug.sf.latch_unsignaled 0
  setprop debug.sf.high_fps_early_phase_offset_ns ""
  setprop debug.sf.high_fps_late_app_phase_offset_ns ""
  setprop persist.sys.surfaceflinger.idle_reduce_framerate_enable ""

  # Reset HWUI and performance settings
  setprop debug.hwui.refresh_rate ""
  setprop debug.hwui.disable_vsync false
  setprop debug.performance.profile 0
  setprop debug.perf.tuning 0
  setprop persist.sys.gpu_perf_mode 0
  setprop debug.mtk.powerhal.hint.bypass ""

  # Reset refresh rate locks
  settings reset system user_refresh_rate
  settings reset system fps_limit
  settings reset system max_refresh_rate_for_ui
  settings reset system max_refresh_rate_for_gaming
  settings reset system min_refresh_rate
  settings reset system max_refresh_rate
  settings reset system peak_refresh_rate
  settings reset system thermal_limit_refresh_rate
  settings reset system NV_FPSLIMIT
  settings reset secure refresh_rate_mode
  settings reset system display_min_refresh_rate
) > /dev/null 2>&1 &

# Reset game-specific optimizations (re-enable battery restrictions)
echo "Restoring battery optimizations for supported games..."
for app in \
  com.netease.newspike \
  com.miHoYo.GenshinImpact \
  com.garena.game.codm \
  com.riotgames.league.wildrift \
  com.mobile.legends \
  com.tencent.ig \
  com.dts.freefireth \
  com.dts.freefiremax \
  com.garena.game.kgvn \
  com.tencent.tmgp.sgame \
  com.roblox.client
do
  dumpsys deviceidle whitelist -$app
  echo "[✔] $app battery optimization restored!"
done

# Final status messages with watermark
echo ""
echo "█▓▒▒░░░RESET STATUS by Agung Developer░░░▒▒▓█"
echo "RESTORE DISPLAY SETTINGS [✓]"
echo "RESTORE THERMAL LIMITS [✓]"
echo "RESTORE GAME OPTIMIZATIONS [✓]"
echo "ALL SETTINGS RESET [✓]"
echo ""
echo "‼️ SYSTEM RESTORED BY AGUNG DEVELOPER ‼️"
echo "REBOOT DEVICE TO ENSURE STABILITY"
echo "█▓▒▒░░░THANKS FOR USING FPS RESET by Agung Developer░░░▒▒▓█"
echo ""

# Final notification
cmd notification post -S bigtext -t 'FPS INJECTOR RESET' 'Tag' 'SETTINGS SUCCESSFULLY RESET by Agung Developer'
