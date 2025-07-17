#!/system/bin/sh
# Restore Device Module by Agung Developer
# Watermark: Agung Developer

# Notification
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Restoring Original Device Properties by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"

echo ""
echo "█▓▒▒░░░RESTORE DEVICE by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5

# Reset device properties to original (using resetprop to clear custom props)
resetprop ro.product.manufacturer
resetprop ro.product.model
resetprop ro.product.brand
resetprop ro.product.name
resetprop ro.build.description
resetprop ro.build.fingerprint
resetprop ro.product.device
resetprop ro.hardware
resetprop ro.board.platform

echo "┌───────────────────────────────┐"
echo "│   RESTORED DEVICE INFO        │"
echo "├───────────────────────────────┤"
echo "│ 📱 Device: $(getprop ro.product.manufacturer) $(getprop ro.product.model)"
echo "│ ⚙️ CPU: $(getprop ro.board.platform)"
echo "│ 🎮 Hardware: $(getprop ro.hardware)"
echo "│ 📲 Android: $(getprop ro.build.version.release)"
echo "└───────────────────────────────┘"
echo ""
echo "█▓▒▒░░░ORIGINAL DEVICE RESTORED by Agung Developer░░░▒▒▓█"
echo ""

cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Original Device Properties Restored by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"
