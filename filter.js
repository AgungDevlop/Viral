const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'Video.json');

const junkPatterns = [
    /^VID-\d{8}-WA\d+$/i,
    /^[a-f0-9]{32,64}$/i,
    /^inbound\d+$/i,
    /^\d+$/,
    /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}.*/i,
    /^v[a-z0-9]{20,}$/i,
    /^[a-zA-Z0-9_]{20,}$/
];

try {
    const rawData = fs.readFileSync(filePath, 'utf8');
    const videos = JSON.parse(rawData);

    const cleanVideos = videos.filter(video => {
        const title = video.Judul.trim();
        if (!title) return false;
        return !junkPatterns.some(pattern => pattern.test(title));
    });

    fs.writeFileSync(filePath, JSON.stringify(cleanVideos, null, 2));
} catch (err) {
    console.error(err);
}
