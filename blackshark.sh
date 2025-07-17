#!/system/bin/sh
# BlackShark Fake Device Module by Agung Developer
# Watermark: Agung Developer

# Notification
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Activating BlackShark Fake Device by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"

echo ""
echo "█▓▒▒░░░BLACKSHARK FAKE DEVICE by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5

# Fake Device Properties
setprop ro.product.manufacturer "BlackShark"
setprop ro.product.model "BlackShark 5 Pro"
setprop ro.product.brand "BlackShark"
setprop ro.product.name "SHARK_KTUS-H0"
setprop ro.build.description "shark_ktus_h-user 12 SKQ1.211006.001 V14.0.0.0 release-keys"
setprop ro.build.fingerprint "BlackShark/SHARK_KTUS-H0/shark_ktus_h:12/SKQ1.211006.001/V14.0.0.0:user/release-keys"
setprop ro.product.device "SHARK_KTUS-H0"
setprop ro.hardware "qcom"
setprop ro.board.platform "snapdragon"

echo "┌───────────────────────────────┐"
echo "│   FAKE DEVICE INFO            │"
echo "├───────────────────────────────┤"
echo "│ 📱 Device: $(getprop ro.product.manufacturer) $(getprop ro.product.model)"
echo "│ ⚙️ CPU: $(getprop ro.board.platform)"
echo "│ 🎮 Hardware: $(getprop ro.hardware)"
echo "│ 📲 Android: $(getprop ro.build.version.release)"
echo "└───────────────────────────────┘"
echo ""
echo "█▓▒▒░░░BLACKSHARK FAKE DEVICE ACTIVATED by Agung Developer░░░▒▒▓█"
echo ""

cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'BlackShark Fake Device Activated by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"
