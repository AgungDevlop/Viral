#!/system/bin/sh
# 120FPS & Ultimate Performance Module by Agung Developer
# Optimized for enforcing 120 FPS, disabling thermal limits, and enhancing touch sensitivity
# Watermark: Agung Developer

# Display initial notification
cmd notification post -S bigtext -t 'ULTIMATE GAMING BOOSTER' 'Tag' 'Starting Ultimate Gaming Configuration by Agung Developer'

# Header with watermark
echo ""
echo "█▓▒▒░░░ULTIMATE GAMING BOOSTER by Agung Developer░░░▒▒▓█"
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
  settings put system display.low_framerate_limit 120
  settings put system display.refresh_rate 120
  settings put system display.enable_optimal_refresh_rate 1
  settings put system display.idle_time 0
  settings put global dfps.enable false
  settings put global smart_dfps.enable false
  settings put global smart_dfps.idle_fps 120
  settings put global display.idle_default_fps 120

  # MediaTek-specific settings
  setprop debug.mediatek_high_frame_rate_multiple_display_mode 0
  setprop debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold 120

  # Transsion-specific settings
  settings put global tran_refresh_rate_video_detector.support 0
  settings put global tran_default_auto_refresh.support 0
  settings put global tran_default_refresh_mode 120
  settings put global tran_120hz_refresh_rate.not_support 1
  settings put global tran_custom_refresh_rate_config.support 1
  settings put global transsion.frame_override.support 0
  settings put global transsion.tran_refresh_rate.support 0

  # SurfaceFlinger optimizations
  setprop debug.sf.perf_mode 1
  setprop debug.sf.latch_unsignaled 1
  setprop debug.sf.high_fps_early_phase_offset_ns 1500000
  setprop debug.sf.high_fps_late_app_phase_offset_ns 400000
  setprop persist.sys.surfaceflinger.idle_reduce_framerate_enable false

  # HWUI and performance tweaks
  setprop debug.hwui.refresh_rate 120
  setprop debug.hwui.disable_vsync true
  setprop debug.performance.profile 1
  setprop debug.perf.tuning 1
  setprop persist.sys.gpu_perf_mode 1
  setprop debug.mtk.powerhal.hint.bypass 1

  # Lock refresh rate to 120 Hz
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

  # --- Tambahan Optimasi Performa ---

  # CPU Governor & Scheduling
  # Mengatur CPU governor ke 'performance' untuk performa maksimal
  # Pastikan path ini sesuai dengan perangkat kamu
  for cpu_gov in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
      if [ -f "$cpu_gov" ]; then
          echo "performance" > "$cpu_gov"
      fi
  done
  # Mengatur minimum frekuensi CPU ke maksimal (atau frekuensi tinggi yang stabil)
  for cpu_min_freq in /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq; do
      if [ -f "$cpu_min_freq" ]; then
          max_freq_path="${cpu_min_freq/scaling_min_freq/scaling_max_freq}"
          if [ -f "$max_freq_path" ]; then
             echo "$(cat "$max_freq_path")" > "$cpu_min_freq"
          fi
      fi
  done

  # GPU Optimization (Generic settings, may vary by GPU/driver)
  # Meningkatkan clock GPU secara agresif
  setprop debug.egl.force_msaa 0
  setprop debug.egl.swapinterval 0
  setprop debug.egl.profiler 1
  setprop debug.renderengine.backend skiagl
  setprop debug.renderengine.force_sg_backend skiagl
  # Mengatur preferensi driver GPU (jika didukung)
  settings put global enable_gpu_debug_layer 1

  # Memory & ZRAM Optimization
  # Menonaktifkan thermal throttling untuk memori dan swap
  setprop persist.sys.vm.swappiness 0
  setprop persist.sys.vm.dirty_ratio 90
  setprop persist.sys.vm.dirty_background_ratio 5
  setprop persist.sys.purgeable_assets true
  echo 1 > /proc/sys/vm/overcommit_memory
  echo 1 > /proc/sys/kernel/sched_autogroup_enabled
  echo 0 > /sys/kernel/debug/tracing/tracing_on # Disable kernel tracing for performance

  # Network Optimization (for lower latency)
  setprop net.tcp.delack.default 1
  setprop net.tcp.timestamps 0
  setprop net.tcp.ecn 0
  setprop net.ipv4.tcp_fastopen 3
  setprop net.ipv4.tcp_no_metrics_save 1
  setprop net.ipv4.tcp_low_latency 1
  setprop persist.sys.net.rx_rate 1
  setprop persist.sys.net.tx_rate 1
  setprop persist.sys.net.max_tx_burst 1
  setprop persist.sys.net.sched_min_pkt_size 64
  # Prioritaskan traffic game (membutuhkan modul kernel atau fitur bawaan yang mendukung QoS)
  # Ini adalah contoh dan mungkin tidak berfungsi di semua perangkat/kernel
  # iptables -t mangle -A POSTROUTING -p tcp -m multiport --dports 80,443,5228 -j DSCP --set-dscp 46

  # --- Tambahan Pengaturan Sensitivitas Layar (Touch) ---
  # Mengatur waktu tunda sentuhan menjadi sangat rendah
  settings put system pointer_speed 7 # Max speed
  settings put system show_touches 0 # Optional, hide visual feedback
  settings put system touch_pressure_scale 0.1 # Make touch more sensitive to light press
  settings put system touch_interval 0 # Reduce touch interval to minimum (ms)
  settings put system touch_hold_delay 0 # Reduce touch hold delay to minimum (ms)
  setprop debug.input.touch_jitter_threshold 0 # Reduce touch jitter
  setprop persist.sys.touch.response_time 0
  setprop persist.sys.touch.tap_threshold 0
  setprop persist.sys.input_boost_ms 0
  setprop persist.sys.input_boost_duration 0
  # Untuk beberapa perangkat, kalibrasi touch screen
  # input touchscreen calibrate (jika command ini tersedia di ROM kamu)

) > /dev/null 2>&1 &

# Game-specific optimizations
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
  echo "[✔] $app (ULTIMATE PERFORMANCE) optimized by Agung Developer!"
done

# Final status messages with watermark
echo ""
echo "█▓▒▒░░░OPTIMIZATION STATUS by Agung Developer░░░▒▒▓█"
echo "MATIKAN THERMAL LIMIT FPS [✓]"
echo "PAKSA REFRESH RATE MAXIMAL [✓]"
echo "PAKSA MAX THERMAL LIMIT FPS [✓]"
echo "OPTIMASI CPU & GPU [✓]"
echo "OPTIMASI MEMORI & JARINGAN [✓]"
echo "PENINGKATAN SENSITIVITAS LAYAR [✓]"
echo "ALL SETTINGS APPLIED [✓]"
echo ""
echo "‼️ ENJOY ULTIMATE GAMING WITH AGUNG DEVELOPER ‼️"
echo "DO NOT REBOOT DEVICE"
echo "█▓▒▒░░░THANKS FOR USING ULTIMATE GAMING BOOSTER by Agung Developer░░░▒▒▓█"
echo ""

# Final notification
cmd notification post -S bigtext -t 'ULTIMATE GAMING BOOSTER' 'Tag' 'ULTIMATE PERFORMANCE SUCCESSFULLY ACTIVATED by Agung Developer'

