#!/system/bin/sh
# iPhone Fake Device Module by Agung Developer
# Watermark: Agung Developer

# Notification
cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'Activating iPhone Fake Device by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"

echo ""
echo "█▓▒▒░░░IPHONE FAKE DEVICE by Agung Developer░░░▒▒▓█"
echo ""
sleep 0.5

# Fake Device Properties
setprop ro.product.manufacturer "Apple"
setprop ro.product.model "iPhone 15 Pro"
setprop ro.product.brand "Apple"
setprop ro.product.name "iPhone15,3"
setprop ro.build.description "iPhone15,3-user 17.0 21A329 release-keys"
setprop ro.build.fingerprint "Apple/iPhone15,3/iPhone15,3:17.0/21A329/123456:user/release-keys"
setprop ro.product.device "iPhone15,3"
setprop ro.hardware "A17"
setprop ro.board.platform "bionic"

echo "┌───────────────────────────────┐"
echo "│   FAKE DEVICE INFO            │"
echo "├───────────────────────────────┤"
echo "│ 📱 Device: $(getprop ro.product.manufacturer) $(getprop ro.product.model)"
echo "│ ⚙️ CPU: $(getprop ro.board.platform)"
echo "│ 🎮 Hardware: $(getprop ro.hardware)"
echo "│ 📲 OS: $(getprop ro.build.version.release)"
echo "└───────────────────────────────┘"
echo ""
echo "█▓▒▒░░░IPHONE FAKE DEVICE ACTIVATED by Agung Developer░░░▒▒▓█"
echo ""

cmd notification post -S bigtext -t 'FPS INJECTOR' 'Tag' 'iPhone Fake Device Activated by Agung Developer' --icon "https://png.pngtree.com/recommend-works/png-clipart/20250321/ourmid/pngtree-green-check-mark-icon-png-image_15808519.png"
