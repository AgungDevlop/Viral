#!/system/bin/sh
# RedMagic Fake Device Module by Agung Developer
# Watermark: Agung Developer

# Notification
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Activating RedMagic Fake Device by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"

echo ""
echo "█▓▒▒░░░REDMAGIC FAKE DEVICE by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5

# Fake Device Properties
setprop ro.product.manufacturer "Nubia"
setprop ro.product.model "RedMagic 9 Pro"
setprop ro.product.brand "Nubia"
setprop ro.product.name "NX769J"
setprop ro.build.description "NX769J-user 14 UKQ1.231117.001 V9.0.0.0 release-keys"
setprop ro.build.fingerprint "Nubia/NX769J/NX769J:14/UKQ1.231117.001/V9.0.0.0:user/release-keys"
setprop ro.product.device "NX769J"
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
echo "█▓▒▒░░░REDMAGIC FAKE DEVICE ACTIVATED by Agung Developer░░░▒▒▓█"
echo ""

cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'RedMagic Fake Device Activated by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"
