#!/system/bin/sh
# ROG Fake Device Module by Agung Developer
# Watermark: Agung Developer

# Notification
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Activating ROG Fake Device by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"

echo ""
echo "█▓▒▒░░░ROG FAKE DEVICE by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5

# Fake Device Properties
setprop ro.product.manufacturer "ASUS"
setprop ro.product.model "ROG Phone 8"
setprop ro.product.brand "ASUS"
setprop ro.product.name "ASUS_AI2401"
setprop ro.build.description "WW_Phone-user 14 UKQ1.231117.001 34.0.0.0 release-keys"
setprop ro.build.fingerprint "ASUS/ASUS_AI2401/WW_Phone:14/UKQ1.231117.001/34.0.0.0:user/release-keys"
setprop ro.product.device "ASUS_AI2401"
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
echo "█▓▒▒░░░ROG FAKE DEVICE ACTIVATED by Agung Developer░░░▒▒▓█"
echo ""

cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'ROG Fake Device Activated by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"
