const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'Video.json');

async function cleanDeadUrls() {
    try {
        const rawData = fs.readFileSync(filePath, 'utf8');
        const videos = JSON.parse(rawData);
        const validVideos = [];

        console.log(`Memulai pengecekan ${videos.length} URL video... ini mungkin butuh waktu.`);

        for (const video of videos) {
            try {
                // Fetch hanya headernya saja dengan timeout 5 detik
                const response = await fetch(video.Url, { 
                    method: 'HEAD',
                    signal: AbortSignal.timeout(5000) 
                });
                
                if (response.ok) {
                    validVideos.push(video);
                } else {
                    console.log(`[Hapus - Status ${response.status}] ${video.Url}`);
                }
            } catch (error) {
                console.log(`[Hapus - Error/Timeout] ${video.Url}`);
            }
        }

        fs.writeFileSync(filePath, JSON.stringify(validVideos, null, 2));
        console.log(`Selesai! Tersisa ${validVideos.length} video aktif.`);

    } catch (err) {
        console.error("Gagal membaca file:", err);
    }
}

cleanDeadUrls();
