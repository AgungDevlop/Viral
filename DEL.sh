#!/system/bin/sh
# Created by Agung Developer

# Notifikasi awal dengan ikon dan watermark
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Starting Cleanup... Created by Agung Developer' --icon com.fps.injector:drawable/ic_launcher

# Header dengan ASCII art
echo "╔════════════════════════════════════╗"
echo "║   FPS INJECTOR - CLEANUP MODULE    ║"
echo "║   Created by Agung Developer       ║"
echo "╚════════════════════════════════════╝"
echo ""

# Tampilkan informasi perangkat
echo "DEVICE INFO:"
echo "Brand: $(getprop ro.product.brand)"
echo "Model: $(getprop ro.product.model)"
echo "CPU: $(getprop ro.hardware)"
echo "GPU: $(getprop ro.hardware.egl)"
echo "SDK: $(getprop ro.build.version.sdk)"
echo ""

# Menghapus pengaturan FPS
echo "Resetting FPS and Display Settings..."
(
    # Pengaturan display dan FPS
    cmd display set-match-content-frame-rate-pref 0
    settings delete system power.dfps.level
    settings delete system disable_idle_fps
    settings delete system disable_idle_fps.threshold
    settings delete system fps.idle_control
    settings delete system metadata_dynfps.disabel
    settings delete system enable_dpps_dynamic_fps
    settings delete system display.disable_dynamic_fps
    settings delete system display.disable_metadata_dynamic_fps
    settings delete system display.low_framerate_limit
    settings delete system display.defer_fps_frame_count
    settings delete system display.refresh_rate
    settings delete system display.large_comp_hint_fps
    settings delete system display.enable_pref_hint_for_low_fps
    settings delete system display.enable_optimal_refresh_rate
    settings delete system display.enable_idle_content_fps_hint
    settings delete system display.refresh_rate_changeable
    settings delete system display.disable_mitigated_fps
    settings delete system display.idle_time
    settings delete system display.idle_time_inactive
    settings delete global dfps.enable
    settings delete global smart_dfps.enable
    settings delete global fps.switch.thermal
    settings delete global fps.switch.default
    settings delete global smart_dfps.idle_fps
    settings delete global display.idle_default_fps
    settings delete global smart_dfps.app_switch_fps
    settings delete global display.fod_monitor_default_fps

    # Pengaturan transmisi perangkat
    resetprop debug.mediatek_high_frame_rate_multiple_display_mode
    resetprop debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold
    settings delete global tran_refresh_rate_video_detector.support
    settings delete global tran_default_auto_refresh.support
    settings delete global tran_default_refresh_mode
    settings delete global tran_low_battery_60hz_refresh_rate.support
    settings delete global tran_90hz_refresh_rate.not_support
    settings delete system surfaceflinger.idle_reduce_framerate_enable
    settings delete global tran_custom_refresh_rate_config.support
    settings delete global transsion.frame_override.support
    settings delete global transsion.tran_refresh_rate.support

    # Pengaturan FPS sistem
    resetprop debug.sys.display.fps
    resetprop debug.sys.game.minfps
    resetprop debug.sys.game.maxfps
    resetprop debug.sys.min_refresh_rate
    resetprop debug.sys.max_refresh_rate
    resetprop debug.sys.peak_refresh_rate
    resetprop debug.sys.sf.fps
    resetprop debug.sys.smartfps
    resetprop debug.sys.vsync_optimization_enable
    resetprop debug.sys.hwui.dyn_vsync
    resetprop debug.sys.vsync
    resetprop debug.sys.hwui.fps_mode
    resetprop debug.sys.first.frame.accelerates
    resetprop debug.sys.fps_unlock_allowed
    resetprop debug.sys.display.max_fps
    resetprop debug.sys.video.max.fps
    resetprop sys.display.fps
    resetprop sys.display_refresh_rate
    resetprop sys.game.minfps
    resetprop sys.game.maxfps
    resetprop sys.game.minframerate
    resetprop sys.game.maxframerate
    resetprop sys.min_refresh_rate
    resetprop sys.max_refresh_rate
    resetprop sys.peak_refresh_rate
    resetprop sys.sf.fps
    resetprop sys.smartfps
    resetprop sys.display.min_refresh_rate
    resetprop sys.vsync_optimization_enable
    resetprop sys.hwui.dyn_vsync
    resetprop sys.vsync
    resetprop sys.hwui.fps_mode
    resetprop sys.first.frame.accelerates
    resetprop sys.fps_unlock_allowed
    resetprop sys.display.max_fps
    resetprop sys.video.max.fps
    resetprop sys.surfaceflinger.idle_reduce_framerate_enable

    # Optimasi refresh rate dan FPS injector
    settings delete global refresh_rate_mode
    settings delete global refresh_rate_switching_type
    settings delete global refresh_rate_force_high
    resetprop debug.hwui.refresh_rate
    resetprop debug.sf.perf_mode
    settings delete global surface_flinger.use_content_detection_for_refresh_rate
    settings delete global media.recorder-max-base-layer-fps
    settings delete global vendor.fps.switch.default
    settings delete system vendor.disable_idle_fps
    settings delete system vendor.display.default_fps
    settings delete system vendor.display.idle_default_fps
    settings delete system vendor.display.enable_optimize_refresh
    settings delete system vendor.display.video_or_camera_fps.support
    settings delete system game_driver_min_frame_rate
    settings delete system game_driver_max_frame_rate
    settings delete system game_driver_power_saving_mode
    settings delete system game_driver_frame_skip_enable
    settings delete system game_driver_vsync_enable
    settings delete system game_driver_gpu_mode
    settings delete system game_driver_fps_limit
    resetprop debug.sf.set_idle_timer_ms
    resetprop debug.sf.latch_unsignaled
    resetprop debug.sf.high_fps_early_phase_offset_ns
    resetprop debug.sf.high_fps_late_app_phase_offset_ns
    resetprop debug.graphics.game_default_frame_rate
    resetprop debug.graphics.game_default_frame_rate.disabled
    resetprop persist.sys.gpu_perf_mode
    resetprop debug.mtk.powerhal.hint.bypass
    resetprop persist.sys.surfaceflinger.idle_reduce_framerate_enable
    resetprop sys.surfaceflinger.idle_reduce_framerate_enable
    resetprop debug.hwui.disable_vsync
    resetprop debug.performance.profile
    resetprop debug.perf.tuning

    # Pengaturan FPS tambahan
    settings delete system user_refresh_rate
    settings delete system fps_limit
    settings delete system max_refresh_rate_for_ui
    settings delete system hwui_refresh_rate
    settings delete system display_refresh_rate
    settings delete system max_refresh_rate_for_gaming
    settings delete system fstb_target_fps_margin_high_fps
    settings delete system fstb_target_fps_margin_low_fps
    settings delete system gcc_fps_margin
    settings delete system tran_low_battery_60hz_refresh_rate.support
    settings delete system vendor.display.refresh_rate
    settings delete secure user_refresh_rate
    settings delete secure miui_refresh_rate
    settings delete system min_frame_rate
    settings delete system max_frame_rate
    settings delete system tran_refresh_mode
    settings delete system last_tran_refresh_mode_in_refresh_setting
    settings delete global min_fps
    settings delete global max_fps
    settings delete system tran_need_recovery_refresh_mode
    settings delete system display_min_refresh_rate
    settings delete system min_refresh_rate
    settings delete system max_refresh_rate
    settings delete system peak_refresh_rate
    settings delete secure refresh_rate_mode
    settings delete system thermal_limit_refresh_rate
    settings delete system NV_FPSLIMIT
) > /dev/null 2>&1 &

# Menghapus whitelist optimalisasi baterai untuk game
echo "Removing Battery Optimization Whitelist..."
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
    dumpsys deviceidle whitelist -$app
    echo "[✔] $app (120FPS) restored to system default."
done
for app in \
    com.dts.freefireth \
    com.dts.freefiremax \
    com.garena.game.kgvn
do
    dumpsys deviceidle whitelist -$app
    echo "[✔] $app (90FPS) restored to system default."
done

# Footer dengan ASCII art
echo ""
echo "╔════════════════════════════════════╗"
echo "║   CLEANUP COMPLETED SUCCESSFULLY   ║"
echo "║   Created by Agung Developer       ║"
echo "╚════════════════════════════════════╝"
echo ""
echo "⚠️ Please reboot your device to apply changes ⚠️"

# Notifikasi akhir dengan ikon dan watermark
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Cleanup Successful! Please reboot device. Created by Agung Developer' --icon com.fps.injector:drawable/ic_launcher
