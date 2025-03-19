# Media Tools Setup and Usage in Termux

This guide will walk you through setting up and using various media tools in Termux. These tools are useful for handling audio, video, and image files, including conversion, editing, compression, and playback.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installing Media Tools](#installing-media-tools)
   - [Audio Tools](#audio-tools)
   - [Video Tools](#video-tools)
   - [Image Tools](#image-tools)
3. [Usage Examples](#usage-examples)
   - [FFmpeg](#ffmpeg)
   - [ImageMagick](#imagemagick)
   - [MPV Player](#mpv-player)
4. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Before proceeding, ensure the following:

1. **Termux Installed**: Download and install Termux from the official source (F-Droid or GitHub).
2. **Internet Connection**: Ensure your device has an active internet connection.
3. **Storage Permissions**: Grant storage permissions to Termux if required:
   ```bash
   termux-setup-storage
   ```

---

## Installing Media Tools

### Audio Tools

These tools are used for handling audio files, including conversion, trimming, and playback.

#### Install FFmpeg
```bash
pkg update && pkg upgrade -y
pkg install ffmpeg -y
```

#### Install SoX (Sound eXchange)
```bash
pkg install sox -y
```

---

### Video Tools

These tools are used for handling video files, including conversion, compression, and playback.

#### Install FFmpeg (for video processing)
```bash
pkg install ffmpeg -y
```

#### Install MPV Player (for video playback)
```bash
pkg install mpv -y
```

---

### Image Tools

These tools are used for handling image files, including resizing, cropping, and format conversion.

#### Install ImageMagick
```bash
pkg install imagemagick -y
```

#### Install Netpbm (for basic image manipulation)
```bash
pkg install netpbm -y
```

---

## Usage Examples

### FFmpeg

FFmpeg is a powerful multimedia framework for handling audio, video, and other media files.

#### Convert Audio Format
Convert an MP3 file to WAV:
```bash
ffmpeg -i input.mp3 output.wav
```

#### Trim a Video
Trim a video from 00:10 to 00:20:
```bash
ffmpeg -i input.mp4 -ss 00:10 -to 00:20 -c copy output.mp4
```

#### Extract Audio from Video
Extract audio from a video file:
```bash
ffmpeg -i input.mp4 -q:a 0 -map a output.mp3
```

**Explanation:**
- `-i`: Input file.
- `-ss`: Start time.
- `-to`: End time.
- `-c copy`: Copy codec without re-encoding.

---

### ImageMagick

ImageMagick is a versatile tool for image manipulation.

#### Resize an Image
Resize an image to 800x600 pixels:
```bash
convert input.jpg -resize 800x600 output.jpg
```

#### Convert Image Format
Convert a PNG file to JPEG:
```bash
convert input.png output.jpg
```

#### Add a Watermark
Add a text watermark to an image:
```bash
convert input.jpg -gravity south -pointsize 40 -fill white -annotate +0+10 "Watermark" output.jpg
```

**Explanation:**
- `-gravity`: Position of the watermark.
- `-pointsize`: Font size.
- `-fill`: Text color.

---

### MPV Player

MPV is a lightweight media player for playing audio and video files.

#### Play a Video File
```bash
mpv video.mp4
```

#### Play an Audio File
```bash
mpv audio.mp3
```

#### Stream Online Content
Stream a YouTube video directly:
```bash
mpv https://www.youtube.com/watch?v=example_video_id
```

**Explanation:**
- Replace `https://www.youtube.com/watch?v=example_video_id` with the actual YouTube video URL.

---

## Troubleshooting

1. **Permission Denied Errors**:
   - Ensure you have granted Termux the necessary permissions.
   - Run `termux-setup-storage` if required.

2. **Tool Not Found**:
   - Update your package list: `pkg update`.
   - Reinstall the tool: `pkg install <tool_name>`.

3. **Playback Issues with MPV**:
   - Ensure the file path is correct.
   - Check if the file format is supported by MPV.

4. **FFmpeg Encoding Errors**:
   - Ensure the input file is not corrupted.
   - Use the `-v error` flag to debug errors:
     ```bash
     ffmpeg -v error -i input.mp4 output.mp4
     ```

---

## Conclusion

By following this guide, you should now have a fully functional media toolkit in Termux. These tools are invaluable for handling audio, video, and image files, whether you're converting formats, editing content, or simply playing media.

For further assistance, refer to the official documentation of each tool or seek help from the Termux community.

Happy media processing! 🎬🖼️
