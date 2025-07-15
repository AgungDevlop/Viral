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
echo ""
echo "
██████╗░███████╗██╗░░░░░███████╗████████╗███████╗
██╔══██╗██╔════╝██║░░░░░██╔════╝╚══██╔══╝██╔════╝
██║░░██║█████╗░░██║░░░░░█████╗░░░░░██║░░░█████╗░░
██║░░██║██╔══╝░░██║░░░░░██╔══╝░░░░░██║░░░██╔══╝░░
██████╔╝███████╗███████╗███████╗░░░██║░░░███████╗
╚═════╝░╚══════╝╚══════╝╚══════╝░░░╚═╝░░░╚══════╝"
echo ""
sleep 3
(
#Neww##
cmd display set-match-content-frame-rate-pref 0
#Pengaturan Fps 3.0
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
#For Device Tranmision 
setprop debug.mediatek_high_frame_rate_multiple_display_mode ""
setprop debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold ""
settings delete global tran_refresh_rate_video_detector.support 
settings delete global tran_default_auto_refresh.support 
settings put global tran_default_refresh_mode 
settings delete global tran_low_battery_60hz_refresh_rate.support 
settings delete global tran_90hz_refresh_rate.not_support 
settings delete system surfaceflinger.idle_reduce_framerate_enable
settings delete system surfaceflinger.idle_reduce_framerate_enable 
settings delete global tran_custom_refresh_rate_config.support 
settings delete global transsion.frame_override.support 
settings delete global transsion.tran_refresh_rate.support 
) > /dev/null 2>&1 &

(
#Pengaturan Fps 3.0
settings put system power.dfps.level 0 
settings put system disable_idle_fps true
settings put system disable_idle_fps.threshold 1
settings put system fps.idle_control false
settings put system metadata_dynfps.disabel 1
settings put system enable_dpps_dynamic_fps 0
settings put system display.disable_dynamic_fps 1
settings put system display.disable_metadata_dynamic_fps 1
settings put system display.low_framerate_limit 120
settings put system display.defer_fps_frame_count 2
settings put system display.refresh_rate 120
settings put system display.large_comp_hint_fps 120
settings put system display.enable_pref_hint_for_low_fps 1
settings put system display.enable_optimal_refresh_rate 1
settings put system display.enable_idle_content_fps_hint 0
settings put system display.refresh_rate_changeable 0
settings put system display.disable_mitigated_fps 1
settings put system display.idle_time 0
settings put system display.idle_time_inactive 0
settings put global dfps.enable false
settings put global smart_dfps.enable false
settings put global fps.switch.thermal false
settings put global fps.switch.default false
settings put global smart_dfps.idle_fps 120
settings put global display.idle_default_fps 120
settings put global smart_dfps.app_switch_fps 120
settings put global display.fod_monitor_default_fps 120
#For Device Tranmision 
setprop debug.mediatek_high_frame_rate_multiple_display_mode 0
setprop debug.mediatek_high_frame_rate_sf_set_big_core_fps_threshold 120
settings put global tran_refresh_rate_video_detector.support 0
settings put global tran_default_auto_refresh.support 0
settings put global tran_default_refresh_mode 120
settings put global tran_low_battery_60hz_refresh_rate.support 0
settings put global tran_90hz_refresh_rate.not_support 0
settings put system surfaceflinger.idle_reduce_framerate_enable false
settings put system surfaceflinger.idle_reduce_framerate_enable no
settings put global tran_custom_refresh_rate_config.support 1
settings put global transsion.frame_override.support 0
settings put global transsion.tran_refresh_rate.support 0
) > /dev/null 2>&1 &

(
#Stable Optimize Fps
setprop debug.sys.display.fps ""
setprop debug.sys.display_refresh_rate ""
setprop debug.sys.display.refresh_rate ""
setprop debug.sys.game.minfps ""
setprop debug.sys.game.maxfps ""
setprop debug.sys.game.minframerate ""
setprop debug.sys.game.maxframerate ""
setprop debug.sys.min_refresh_rate ""
setprop debug.sys.max_refresh_rate ""
setprop debug.sys.peak_refresh_rate ""
setprop debug.sys.sf.fps ""
setprop debug.sys.smartfps ""
setprop debug.sys.display.min_refresh_rate ""
setprop debug.sys.vsync_optimization_enable ""
setprop debug.sys.hwui.dyn_vsync ""
setprop debug.sys.vsync ""
setprop debug.sys.hwui.fps_mode ""
setprop debug.sys.first.frame.accelerates ""
setprop debug.sys.fps_unlock_allowed ""
setprop debug.sys.display.max_fps ""
setprop debug.sys.video.max.fps ""
setprop debug.sys.surfaceflinger.idle_reduce_framerate_enable ""
) > /dev/null 2>&1 &

(
#Stable Optimize Fps Device Tranmisi
setprop sys.display.fps 120
setprop sys.display_refresh_rate 120
setprop sys.display.refresh_rate 120
setprop sys.game.minfps 120
setprop sys.game.maxfps 120
setprop sys.game.minframerate 120
setprop sys.game.maxframerate 120
setprop sys.min_refresh_rate 120
setprop sys.max_refresh_rate 120
setprop sys.peak_refresh_rate 120
setprop sys.sf.fps 120
setprop sys.smartfps 1
setprop sys.display.min_refresh_rate 120
setprop sys.vsync_optimization_enable false
setprop sys.hwui.dyn_vsync 0
setprop sys.vsync false
setprop sys.hwui.fps_mode 1
setprop sys.first.frame.accelerates true
setprop sys.fps_unlock_allowed 120
setprop sys.display.max_fps 120
setprop sys.video.max.fps 120
setprop sys.surfaceflinger.idle_reduce_framerate_enable false
) > /dev/null 2>&1 &

(
# UNINSTALL TWEAK - Optimize Refresh Rate & FPS Injector
settings delete global refresh_rate_mode 
settings delete global refresh_rate_switching_type 
settings delete global refresh_rate_force_high 
setprop debug.hwui.refresh_rate ""
setprop debug.sf.perf_mode ""
settings delete global surface_flinger.use_content_detection_for_refresh_rate
settings delete global media.recorder-max-base-layer-fps
settings delete global vendor.fps.switch.default
settings delete global vendor.display.default_fps
settings delete global refresh.active
settings delete system vendor.disable_idle_fps
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
setprop debug.hwui.refresh_rate ""
setprop debug.sf.set_idle_timer_ms ""
setprop debug.sf.latch_unsignaled ""
setprop debug.sf.high_fps_early_phase_offset_ns ""
setprop debug.sf.high_fps_late_app_phase_offset_ns ""
setprop debug.graphics.game_default_frame_rate ""
setprop debug.graphics.game_default_frame_rate.disabled ""
setprop persist.sys.gpu_perf_mode ""
setprop debug.mtk.powerhal.hint.bypass ""
setprop persist.sys.surfaceflinger.idle_reduce_framerate_enable ""
setprop sys.surfaceflinger.idle_reduce_framerate_enable ""
setprop debug.sf.perf_mode ""
setprop debug.hwui.disable_vsync
setprop debug.performance.profile ""
setprop debug.perf.tuning ""
settings delete system user_refresh_rate
settings delete system fps_limit
settings delete system max_refresh_rate_for_ui
settings delete system hwui_refresh_rate 
settings delete system display_refresh_rate 
settings delete system max_refresh_rate_for_gaming
settings delete system user_refresh_rate
settings put system peak_refresh_rate 60
settings delete system thermal_limit_refresh_rate
settings delete system max_refresh_rate
settings delete system min_refresh_rate
) > /dev/null 2>&1 &

echo "Menghapus whitelist optimalisasi baterai untuk game yang support 120 FPS dan 90 FPS"
(
# Game support 120 FPS
for app in \
com.netease.newspike
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
    echo "[✔] $app (120FPS) telah dikembalikan ke pengaturan default sistem."
done
# Game support 90 FPS
for app in \
com.dts.freefireth \
com.dts.freefiremax \
com.garena.game.kgvn
do
    dumpsys deviceidle whitelist -$app
    echo "[✔] $app (90FPS) telah dikembalikan ke pengaturan default sistem."
done
) > /dev/null 2>&1 &

sleep 0.5
echo""
echo "DELETE ALL STRING{√}"
echo""
sleep 0.5
echo""
echo "‼️REBOOT DEVICE ‼️"
echo""
sleep 0.5
echo""
echo "DEV LIMIT GAMING GANTENG"
echo""
sleep 0.5
echo""
echo "DONE UNINSTALL"
echo""
sleep 0.5
echo""
echo "█▓▒▒░░░THANKS FOR USING MODULE ░░░▒▒▓█"
echo""
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'SUCCES DELETE.'