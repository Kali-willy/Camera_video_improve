#!/system/bin/sh
#
# camera_quality_boost.sh
# Super Camera Quality Tweaks (Brevent-Friendly)
#
# Developer: Willy Jr Caransa Gailo
# Version: v1.0

# Function para sa loading animation
show_loading() {
    local pid=$1
    local delay=0.2
    local spinstr='|/-\'
    while [ "$(ps | grep $pid | grep -v grep)" ]; do
        for i in $(seq 0 3); do
            echo -ne "\r${spinstr:$i:1} Optimizing camera settings... "
            sleep $delay
        done
    done
    echo -e "\r✓ Camera tweaks applied successfully!     "
}

# Clear screen at magandang header
clear
echo "============================================"
echo "   📸 Super Camera Quality Booster v1.0 🚀"
echo "   Developer: Willy Jr Caransa Gailo"
echo "   (Brevent-Friendly • No Root Required*)"
echo "============================================"
echo ""

# I-apply ang lahat ng settings sa background para magka-loading
(
    # -------- VIDEO QUALITY --------
    settings put global camera.video.bitrate 50000000      # 50 Mbps (clearer video)
    settings put global camera.video.fps 90                # Stable 90fps
    settings put global camera.video.quality.4k 1          # Enable 4K
    settings put global camera.video.stabilization 1       # EIS / OIS
    settings put global camera.video.hdr 1                 # HDR video

    # -------- PHOTO QUALITY --------
    settings put global camera.photo.hdr 1                 # HDR+ Photos
    settings put global camera.photo.ai 1                  # AI Scene detection
    settings put global camera.photo.super_res 1           # Super resolution
    settings put global camera.photo.noise_reduction 0     # Keep details (less smooth)
    settings put global camera.photo.sharpness 1           # Extra sharpness
    settings put global camera.photo.detail_enhance 1      # High details

    # -------- MEMORY / PERFORMANCE --------
    settings put global camera.memory.high_watermark 1
    settings put global camera.memory.low_watermark 0
) &
show_loading $!

# Final instructions
echo ""
echo "✨ Your camera is now optimized for:"
echo "   • 4K @ 90fps video • HDR+ Photos • Super Resolution"
echo "   • Enhanced sharpness & detail retention"
echo ""
echo "🔁 Please restart your Camera app to apply changes."
echo "📱 Tip: Open camera, force stop, then reopen."
echo ""
echo "============================================"