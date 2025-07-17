#!/system/bin/sh
# iPhone 16 Pro Max Fake Device Module by Agung Developer
# Watermark: Agung Developer

# Notification
cmd notification post -S bigtext -t 'IPHONE 16 PRO MAX' 'Tag' 'Activating iPhone 16 Pro Max Fake Device' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png" > /dev/null 2>&1

echo ""
echo "█▓▒▒░░░FAKE DEVICE IPHONE 16 PRO MAX░░░▒▒▓█"
echo ""
sleep 0.5

# Display current device info
echo "┌───────────────────────────────┐"
echo "│ 📱 Device: $(getprop ro.product.manufacturer) $(getprop ro.product.model)"
echo "│ ⚙️ CPU: $(getprop ro.board.platform)"
echo "│ 🎮 Hardware: $(getprop ro.hardware)"
echo "│ 📲 OS: $(getprop ro.build.version.release)"
echo "│ 🔥 Thermal: $(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null || echo 'N/A')°C"
echo "│ 🔰 Kernel: $(uname -r)"
echo "│ 🔹 Build: $(getprop ro.build.display.id)"
echo "│ 🛑 Root: $(if [ $(id -u 2>/dev/null) -eq 0 ]; then echo 'Yes'; else echo 'No'; fi)"
echo "│ 🔗 SELinux: $(getenforce)"
echo "└───────────────────────────────┘"
echo ""

# Apple logo ASCII art
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣴⣶⡆⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⣀⣀⣄⣀⡀⠀⢸⣿⣿⣿⣁⣄⣀⣀⡀⠀⠀⠀"
echo "⠀⣠⣼⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀"
echo "⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀"
echo "⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀"
echo "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀"
echo "⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀"
echo "⢼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀"
echo "⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄"
echo "⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏"
echo "⠀⠀⠚⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀"
echo "⠀⠀⠀⠀⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀"
echo "⠀⠀⠀⠀⠀⠘⠻⣿⠿⠛⠋⠉⠉⠙⠛⠛⠛⠿⠛⠁⠀⠀⠀"
echo ""
sleep 0.5

# Performance optimization
setprop debug.performance.tuning 1
setprop debug.sf.hw 1
setprop debug.egl.hw 1
settings put global activity_manager_constants "power_check_max_cpu_1=0,power_check_max_cpu_2=0,power_check_max_cpu_3=0,power_check_max_cpu_4=0,power_check_max_cpu_5=0,power_check_max_cpu_6=0,power_check_max_cpu_7=0,power_check_max_cpu_8=0"
cmd stats clear-puller-cache
cmd display ab-logging-disable
cmd display dwb-logging-disable
cmd display set-match-content-frame-rate-pref 2
logcat -c --wrap
simpleperf --log fatal --log-to-android-buffer 0
cmd activity clear-watch-heap -a
cmd looper_stats disable
am memory-factor set CRITICAL
cmd power set-adaptive-power-saver-enabled false
cmd power set-fixed-performance-mode-enabled true
cmd thermalservice override-status 0

# Unlock FPS
setprop debug.sys.display.fps 144
setprop debug.sys.display_refresh_rate 144
setprop debug.sys.game.minfps 144
setprop debug.sys.game.maxfps 144
setprop debug.sys.game.minframerate 144
setprop debug.sys.game.maxframerate 144
setprop debug.sys.min_refresh_rate 144
setprop debug.sys.max_refresh_rate 144
setprop debug.sys.peak_refresh_rate 144
setprop debug.sys.sf.fps 144
setprop debug.sys.touch.sensitivity 8
setprop debug.sys.touch.responsiveness 8
setprop debug.sys.smartfps 1
setprop debug.sys.display.min_refresh_rate 144
setprop debug.sys.vsync_optimization_enable false
setprop debug.sys.hwui.dyn_vsync 1
setprop debug.sys.vsync false
setprop debug.sys.hwui.fps_mode 1
setprop debug.sys.tran.device.name "iPhone 16 Pro Max"
setprop debug.sys.dalvik.hyperthreading true
setprop debug.sys.dalvik.multithread true
setprop debug.sys.multithreaded.dexlayout.enable true
setprop debug.sys.multithreaded.dexloader.enable true
setprop debug.sys.first.frame.accelerates true
setprop debug.sys.fps_unlock_allowed 144
setprop debug.sys.display.max_fps 144
setprop debug.sys.video.max.fps 144
setprop debug.sys.surfaceflinger.idle_reduce_framerate_enable no
setprop debug.sys.surfaceflinger.enable_gpu 1
setprop debug.sys.thermal.protection 0
setprop debug.sys.thermal.ambient_temperature 0
setprop debug.sys.thermal.enable_detailed 0
setprop debug.dev.pm.dyn_samplingrate 0

# Touch sensitivity spoof
settings put global persist.sys.touch.sampling_boost 1
settings put global persist.sys.display_high_refresh_rate true
settings put global persist.vendor.display.use_smooth_motion true
settings put global ro.surface_flinger.has_wide_color_display true
settings put global persist.sys.sf.native_mode 1
settings put global persist.sys.touch.sensitivity 10
settings put global persist.sys.touch.responsiveness 10

# Performance stability
setprop debug.egl.force_msaa false
setprop debug.hwui.use_gpu_pixel_buffers 1
setprop debug.hwui.target_cpu_time_percent 10
setprop debug.hwui.render_dirty_regions false
setprop debug.hwui.disable_vsync false
setprop debug.hwui.level 0
setprop debug.kill_allocating_task 0
setprop debug.gralloc.gfx_ubwc_disable 0
setprop debug.rs.default-CPU-driver 1
setprop debug.rs.forcecompat 1
setprop debug.rs.max-threads 8
setprop debug.choreographer.skipwarning 30
setprop debug.choreographer.frametime false
setprop debug.display.allow_non_native_refresh_rate_override 1
setprop debug.display.render_frame_rate_is_physical_refresh_rate 1
setprop debug.sf.use_phase_offsets_as_durations 1
setprop debug.sf.predict_hwc_composition_strategy 0
setprop debug.sf.enable_transaction_tracing false
setprop debug.sf.disable_client_composition_cache 1
setprop debug.sf.gpu_freq_indeks 7
setprop debug.sf.use_frame_rate_priority 1
setprop debug.sf.disable_backpressure 1
setprop debug.sf.enable_gl_backpressure 1
setprop debug.atrace.tags.enableflags 0
setprop debug.cpurend.vsync false
setprop debug.composition.type gpu
setprop debug.checkjni 0
setprop debug.gr.numframebuffers 3

# CPU spoof for iPhone 16 Pro Max
settings put global ro.board.platform T8123
settings put global ro.vendor.apple.chip_name T8123
settings put global ro.vendor.apple.soc_model T8123
settings put global ro.vendor.apple.soc_name T8123
settings put global ro.vendor.soc.manufacturer "Apple Inc."
settings put global ro.vendor.soc.model.external_name "Apple A17 Pro"
settings put global ro.vendor.soc.model.part_name A17 Pro
settings put global ro.soc.manufacturer "Apple A17 Pro"
settings put global ro.soc.model "Apple A17 Pro"

# Device spoof
setprop debug.sys.tran.device.name "iPhone 16 Pro Max"
settings put system about_name "iPhone 16 Pro Max"
settings put secure oppo_device_name "iPhone 16 Pro Max"
settings put global vivo_device_name "iPhone 16 Pro Max"
setprop persist.sys.tran.device.name "iPhone 16 Pro Max"
setprop persist.sys.devicename "iPhone 16 Pro Max"
setprop persist.sys.device_name "iPhone 16 Pro Max"
settings put global ro.product.brand Apple
settings put global ro.product.vendor.manufacturer Apple
settings put global ro.product.odm.manufacturer Apple
settings put global ro.product.vendor.brand Apple
settings put global ro.product.manufacturer Apple
settings put global ro.product.model iPhone16,1
settings put global ro.product.marketname "iPhone 16 Pro Max"
settings put global ro.product.system.marketname "iPhone 16 Pro Max"
settings put global ro.product.system.model iPhone16,1
settings put global ro.product.vendor.model iPhone16,1
settings put global ro.product.vendor.marketname "iPhone 16 Pro Max"
settings put global ro.product.vendor.manufacturer Apple
settings put global ro.product.vendor.brand Apple
settings put global ro.product.odm.marketname "iPhone 16 Pro Max"
settings put global ro.product.odm.model iPhone16,1
settings put global ro.product.product.marketname "iPhone 16 Pro Max"
settings put global ro.product.product.model iPhone16,1
settings put global ro.build.product iPhone16,1
settings put global ro.chipset A17 Pro

# Chipset spoof
settings put global ro.soc.manufacturer Apple
settings put global ro.vendor.soc.manufacturer Apple
settings put global ro.hardware.chipname A17 Pro
settings put global ro.chipname A17 Pro
settings put global ro.soc.model A17 Pro
settings put global ro.vendor.soc.model A17 Pro
settings put global ro.soc.model.external_name "Apple A17 Pro"
settings put global ro.soc.model.part_name A17 Pro
settings put global ro.qti.soc_name A17 Pro
settings put global ro.qti.soc_model A17 Pro
settings put global ro.mtk.soc_name A17 Pro
settings put global ro.mtk.soc_model A17 Pro
settings put global ro.vendor.soc.model.external_name "Apple A17 Pro"
settings put global ro.vendor.soc.model.part_name A17 Pro
settings put global ro.vendor.qti.soc_name A17 Pro
settings put global ro.vendor.qti.soc_model A17 Pro
settings put global ro.vendor.mtk.soc_name A17 Pro
settings put global ro.vendor.mtk.soc_model A17 Pro

# Additional spoof for phone info
settings put global device_name "iPhone 16 Pro Max"
settings put system model "iPhone 16 Pro Max"
settings put global ro.product.cpu.abi "Apple Inc."
settings put global ro.product.cpu.abilist "arm64-v8a,armeabi-v7a,armeabi"
settings put global ro.product.cpu.name "Apple A17 Pro"
settings put global ro.product.vendor.cert "iPhone 16 Pro Max"
settings put global ro.product.Aliases iPhone16,1
settings put global ro.build.tf.modelnumber iPhone16,1
settings put global ro.product.system_ext.brand Apple
settings put global ro.product.system_ext.device iPhone16,1
settings put global ro.product.system_ext.manufacturer Apple
settings put global ro.product.system_ext.marketname "iPhone 16 Pro Max"

echo ""
echo "ALL SET PROSES [✓]"
echo ""
echo "SUKSES SPOOFER IPHONE 16 PRO MAX"
echo ""
echo "█▓▒▒░░░FAKE DEVICE ACTIVATED░░░▒▒▓█"
echo ""

cmd notification post -S bigtext -t 'IPHONE 16 PRO MAX' 'Tag' 'iPhone 16 Pro Max Fake Device Activated' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png" > /dev/null 2>&1
