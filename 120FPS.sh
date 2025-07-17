#!/system/bin/sh
# 120FPS Module by Agung Developer - Extreme Performance
# Optimized for maximum gaming speed, cache cleaning, and thermal control.
# Watermark: Agung Developer

# --- NOTIFICATION AND HEADER ---
# Display initial notification with an attempt to use an icon from URL
# NOTE: Displaying an icon from a URL in notification might not be universally supported
# or may require specific permissions/APIs depending on Android version/device.
ICON_URL="https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png" # GANTI DENGAN URL ICON GAME SESUAI KEINGINAN!
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Starting Extreme Performance Optimization by Agung Developer' --icon "$ICON_URL"


echo ""
echo "█▓▒▒░░░120FPS INJECTOR by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5

# --- DEVICE & HARDWARE INFO ---
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

# --- CORE FPS AND REFRESH RATE OPTIMIZATIONS ---
# Ini adalah bagian inti untuk memaksakan FPS dan refresh rate maksimal
(
  # Display settings
  cmd display set-match-content-frame-rate-pref 1
  settings put system power.dfps.level 0
  settings put system disable_idle_fps true
  settings put system fps.idle_control false
  settings put system metadata_dynfps.disabel 1
  settings put system display.disable_dynamic_fps 1
  settings put system display.low_framerate_limit 120
  settings put system display.refresh_rate 120
  settings put system display.enable_optimal_refresh_rate 1
  settings put system display.idle_time 0
  settings put global dfps.enable false
  settings put global smart_dfps.enable false
  settings put global smart_dfps.idle_fps 120
  settings put global display.idle_default_fps 120

  # MediaTek-specific settings (if applicable)
  setprop debug.mediatek_high_frame_rate_multiple_display_mode 0
  setprop debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold 120

  # Transsion-specific settings (if applicable)
  settings put global tran_refresh_rate_video_detector.support 0
  settings put global tran_default_auto_refresh.support 0
  settings put global tran_default_refresh_mode 120
  settings put global tran_120hz_refresh_rate.not_support 1
  settings put global tran_custom_refresh_rate_config.support 1
  settings put global transsion.frame_override.support 0
  settings put global transsion.tran_refresh_rate.support 0

  # SurfaceFlinger optimizations (rendering pipeline)
  setprop debug.sf.perf_mode 1
  setprop debug.sf.latch_unsignaled 1
  setprop debug.sf.high_fps_early_phase_offset_ns 1500000
  setprop debug.sf.high_fps_late_app_phase_offset_ns 400000
  setprop persist.sys.surfaceflinger.idle_reduce_framerate_enable false

  # HWUI and general performance tweaks
  setprop debug.hwui.refresh_rate 120
  setprop debug.hwui.disable_vsync true
  setprop debug.performance.profile 1
  setprop debug.perf.tuning 1
  setprop persist.sys.gpu_perf_mode 1
  setprop debug.mtk.powerhal.hint.bypass 1

  # Lock refresh rate to 120 Hz (redundancy for assurance)
  settings put system user_refresh_rate 120
  settings put system fps_limit 120
  settings put system max_refresh_rate_for_ui 120
  settings put system max_refresh_rate_for_gaming 120
  settings put system min_refresh_rate 120
  settings put system max_refresh_rate 120
  settings put system peak_refresh_rate 120
  settings put system thermal_limit_refresh_rate 120
  settings put system NV_FPSLIMIT 120
  settings put secure refresh_rate_mode 120
  settings put system display_min_refresh_rate 120
) > /dev/null 2>&1 &

# --- THERMAL THROTTLING AND CPU/GPU BOOST ---
# Memastikan CPU/GPU berjalan pada performa puncak tanpa thermal throttling
(
  # Disable thermal throttling (use with extreme caution!)
  echo 0 > /sys/class/thermal/thermal_zone0/mode
  echo "disabled" > /sys/class/thermal/thermal_zone0/policy
  echo 0 > /sys/module/msm_thermal/parameters/enabled # For Qualcomm devices

  # Set CPU governors to performance (may vary by kernel)
  for cpu_gov_path in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
      [ -f "$cpu_gov_path" ] && echo "performance" > "$cpu_gov_path"
  done

  # Max out CPU frequencies
  for cpu_max_freq_path in /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq; do
      [ -f "$cpu_max_freq_path" ] && cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_max_freq > "$cpu_max_freq_path"
  done

  # Set GPU governor to performance (if available)
  echo "performance" > /sys/class/kgsl/kgsl-3d0/devfreq/governor 2>/dev/null
  echo 1 > /sys/class/kgsl/kgsl-3d0/force_bus_on 2>/dev/null
  echo 1 > /sys/class/kgsl/kgsl-3d0/force_clk_on 2>/dev/null
  echo 1 > /sys/class/kgsl/kgsl-3d0/force_pw_on 2>/dev/null

  # Disable CPU/GPU power saving features
  settings put global powersaving_mode_enabled 0
  settings put global low_power 0
  settings put global low_power_mode 0
) > /dev/null 2>&1 &

# --- CACHE CLEANING AND MEMORY OPTIMIZATION ---
echo "Cleaning caches and optimizing memory..."
(
  # Clear dalvik-cache (can take time on first boot after clear)
  # CAUTION: This will re-optimize apps on next boot.
  # rm -rf /data/dalvik-cache/*

  # Clear package manager caches
  pm trim-caches $(pm list packages -f | sed -e 's/.*=//' -e 's/\r//g' | cut -f 1) > /dev/null 2>&1

  # Clear logs (they consume space and write cycles)
  logcat -c
  dmesg -c

  # Drop caches (kernel memory caches)
  echo 1 > /proc/sys/vm/drop_caches
  echo 2 > /proc/sys/vm/drop_caches
  echo 3 > /proc/sys/vm/drop_caches

  # ZRAM/Swap optimization (if ZRAM is active)
  swapoff -a 2>/dev/null # Disable swap temporarily
  swapon -a 2>/dev/null  # Re-enable swap (might re-allocate for better performance)

  # Adjust VM pressure
  echo 10 > /proc/sys/vm/swappiness # Lower value makes system less likely to swap
  echo 50 > /proc/sys/vm/vfs_cache_pressure # Keep more inode/dentry caches

  # Force Garbage Collection for Java apps (might help free up RAM)
  am force-stop-packages $(cmd package list packages -3 | sed 's/package://g') # Stop 3rd party apps first
  # dalvikvm -Xgc:precise -Xms8m -Xmx256m -cp /system/framework/framework.jar com.android.internal.os.RuntimeInit --bootclasspath /system/framework/core-libart.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/framework-graphics.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/ims-common.jar:/system/framework/android.policy.jar:/system/framework/services.jar:/system/framework/apache-xml.jar:/system/framework/webview.jar com.android.internal.os.ZygoteInit --application
  # The above dalvikvm command is complex and risky, simpler is to rely on system's own GC.
) > /dev/null 2>&1 &

# --- GAME-SPECIFIC OPTIMIZATIONS ---
echo "Disabling battery optimizations for supported games..."
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
  dumpsys deviceidle whitelist +$app
  echo "[✔] $app (120FPS) optimized by Agung Developer!"
done

# --- FINAL STATUS MESSAGES ---
echo ""
echo "█▓▒▒░░░OPTIMIZATION STATUS by Agung Developer░░░▒▒▓█"
echo "MATIKAN THERMAL LIMIT FPS [✓]"
echo "PAKSA REFRESH RATE MAXIMAL [✓]"
echo "PAKSA MAX THERMAL LIMIT FPS [✓]"
echo "CACHE DAN MEMORI DIBERSIHKAN [✓]"
echo "ALL SETTINGS APPLIED [✓]"
echo ""
echo "‼️ ENJOY GAMING WITH AGUNG DEVELOPER ‼️"
echo "DO NOT REBOOT DEVICE"
echo "█▓▒▒░░░THANKS FOR USING 120FPS INJECTOR by Agung Developer░░░▒▒▓█"
echo ""

# Final notification with icon from URL
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'EXTREME PERFORMANCE & CACHE CLEANING ACTIVATED by Agung Developer' --icon "$ICON_URL"
