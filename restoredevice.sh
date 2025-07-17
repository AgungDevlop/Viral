#!/system/bin/sh
# Restore Device Module by Agung Developer
# Watermark: Agung Developer

# Notification
cmd notification post -S bigtext -t 'RESTORE DEVICE' 'Tag' 'Restoring Original Device Properties' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png" > /dev/null 2>&1

echo ""
echo "█▓▒▒░░░RESTORE DEVICE░░░▒▒▓█"
echo ""
sleep 0.5

# Display current device info
echo "┌───────────────────────────────┐"
echo "│ 📱 Device: $(getprop ro.product.manufacturer) $(getprop ro.product.model)"
echo "│ ⚙️ CPU: $(getprop ro.board.platform)"
echo "│ 🎮 Hardware: $(getprop ro.hardware)"
echo "│ 📲 Android: $(getprop ro.build.version.release)"
echo "│ 🔥 Thermal: $(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null || echo 'N/A')°C"
echo "│ 🔰 Kernel: $(uname -r)"
echo "│ 🔹 Build: $(getprop ro.build.display.id)"
echo "│ 🛑 Root: $(if [ $(id -u 2>/dev/null) -eq 0 ]; then echo 'Yes'; else echo 'No'; fi)"
echo "│ 🔗 SELinux: $(getenforce)"
echo "└───────────────────────────────┘"
echo ""
sleep 0.5

# Reset device properties
resetprop debug.performance.tuning
resetprop debug.sf.hw
resetprop debug.egl.hw
resetprop debug.sys.display.fps
resetprop debug.sys.display_refresh_rate
resetprop debug.sys.game.minfps
resetprop debug.sys.game.maxfps
resetprop debug.sys.game.minframerate
resetprop debug.sys.game.maxframerate
resetprop debug.sys.min_refresh_rate
resetprop debug.sys.max_refresh_rate
resetprop debug.sys.peak_refresh_rate
resetprop debug.sys.sf.fps
resetprop debug.sys.touch.sensitivity
resetprop debug.sys.touch.responsiveness
resetprop debug.sys.smartfps
resetprop debug.sys.display.min_refresh_rate
resetprop debug.sys.vsync_optimization_enable
resetprop debug.sys.hwui.dyn_vsync
resetprop debug.sys.vsync
resetprop debug.sys.hwui.fps_mode
resetprop debug.sys.tran.device.name
resetprop debug.sys.dalvik.hyperthreading
resetprop debug.sys.dalvik.multithread
resetprop debug.sys.multithreaded.dexlayout.enable
resetprop debug.sys.multithreaded.dexloader.enable
resetprop debug.sys.first.frame.accelerates
resetprop debug.sys.fps_unlock_allowed
resetprop debug.sys.display.max_fps
resetprop debug.sys.video.max.fps
resetprop debug.sys.surfaceflinger.idle_reduce_framerate_enable
resetprop debug.sys.surfaceflinger.enable_gpu
resetprop debug.sys.thermal.protection
resetprop debug.sys.thermal.ambient_temperature
resetprop debug.sys.thermal.enable_detailed
resetprop debug.dev.pm.dyn_samplingrate
resetprop debug.egl.force_msaa
resetprop debug.hwui.use_gpu_pixel_buffers
resetprop debug.hwui.target_cpu_time_percent
resetprop debug.hwui.render_dirty_regions
resetprop debug.hwui.disable_vsync
resetprop debug.hwui.level
resetprop debug.kill_allocating_task
resetprop debug.gralloc.gfx_ubwc_disable
resetprop debug.rs.default-CPU-driver
resetprop debug.rs.forcecompat
resetprop debug.rs.max-threads
resetprop debug.choreographer.skipwarning
resetprop debug.choreographer.frametime
resetprop debug.display.allow_non_native_refresh_rate_override
resetprop debug.display.render_frame_rate_is_physical_refresh_rate
resetprop debug.sf.use_phase_offsets_as_durations
resetprop debug.sf.predict_hwc_composition_strategy
resetprop debug.sf.enable_transaction_tracing
resetprop debug.sf.disable_client_composition_cache
resetprop debug.sf.gpu_freq_indeks
resetprop debug.sf.use_frame_rate_priority
resetprop debug.sf.disable_backpressure
resetprop debug.sf.enable_gl_backpressure
resetprop debug.atrace.tags.enableflags
resetprop debug.cpurend.vsync
resetprop debug.composition.type
resetprop debug.checkjni
resetprop debug.gr.numframebuffers
resetprop ro.board.platform
resetprop ro.vendor.apple.chip_name
resetprop ro.vendor.apple.soc_model
resetprop ro.vendor.apple.soc_name
resetprop ro.vendor.soc.manufacturer
resetprop ro.vendor.soc.model.external_name
resetprop ro.vendor.soc.model.part_name
resetprop ro.soc.manufacturer
resetprop ro.soc.model
resetprop persist.sys.tran.device.name
resetprop persist.sys.devicename
resetprop persist.sys.device_name
resetprop ro.product.brand
resetprop ro.product.vendor.manufacturer
resetprop ro.product.odm.manufacturer
resetprop ro.product.vendor.brand
resetprop ro.product.manufacturer
resetprop ro.product.model
resetprop ro.product.marketname
resetprop ro.product.system.marketname
resetprop ro.product.system.model
resetprop ro.product.vendor.model
resetprop ro.product.vendor.marketname
resetprop ro.product.odm.marketname
resetprop ro.product.odm.model
resetprop ro.product.product.marketname
resetprop ro.product.product.model
resetprop ro.build.product
resetprop ro.chipset
resetprop ro.hardware.chipname
resetprop ro.chipname
resetprop ro.soc.model.external_name
resetprop ro.soc.model.part_name
resetprop ro.qti.soc_name
resetprop ro.qti.soc_model
resetprop ro.mtk.soc_name
resetprop ro.mtk.soc_model
resetprop ro.vendor.soc.model
resetprop ro.vendor.qti.soc_name
resetprop ro.vendor.qti.soc_model
resetprop ro.vendor.mtk.soc_name
resetprop ro.vendor.mtk.soc_model
resetprop ro.product.cpu.abi
resetprop ro.product.cpu.abilist
resetprop ro.product.cpu.name
resetprop ro.product.vendor.cert
resetprop ro.product.Aliases
resetprop ro.build.tf.modelnumber
resetprop ro.product.system_ext.brand
resetprop ro.product.system_ext.device
resetprop ro.product.system_ext.manufacturer
resetprop ro.product.system_ext.marketname

# Reset settings
settings delete global activity_manager_constants
settings delete global persist.sys.touch.sampling_boost
settings delete global persist.sys.display_high_refresh_rate
settings delete global persist.vendor.display.use_smooth_motion
settings delete global ro.surface_flinger.has_wide_color_display
settings delete global persist.sys.sf.native_mode
settings delete global persist.sys.touch.sensitivity
settings delete global persist.sys.touch.responsiveness
settings delete global device_name
settings delete system model
settings delete system about_name
settings delete secure oppo_device_name
settings delete global vivo_device_name

echo ""
echo "ALL SET PROSES [✓]"
echo ""
echo "SUKSES RESTORE ORIGINAL DEVICE"
echo ""
echo "█▓▒▒░░░ORIGINAL DEVICE RESTORED░░░▒▒▓█"
echo ""

cmd notification post -S bigtext -t 'RESTORE DEVICE' 'Tag' 'Original Device Properties Restored' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png" > /dev/null 2>&1
