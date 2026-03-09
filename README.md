> [!WARNING]
> This solution makes it so that VRChat is not allowed to update `yt-dlp.exe` when updating, 
> so you have to manually update `yt-dlp.exe` each time, which you can do so by running this script again.
> However, you can follow instructions in [Removing `Read-only` on `yt-dlp.exe`](#removing-read-only-on-yt-dlpexe) to easily uninstall this patch.
>
> Updating `yt-dlp.exe` also does not guarantee YouTube videos will work outright.
> For a more effective solution, use [VRCVideoCacher](https://github.com/EllyVR/VRCVideoCacher).

# VRChat yt-dlp Updater
A simple Windows command-line batch file that allows you to update VRChat's version of [yt-dlp](https://github.com/yt-dlp/yt-dlp) without having to go through downloading and managing files. Works only for systems that contain **Windows 10 and later**. Made open-source with full intention for those who are already suspicious with batch files in the first place.

This is created for those who doesn't want to deal with the process of manually updating VRChat's yt-dlp, resulting in videos from YouTube inside VRChat not loading globally.

**Download:** (Windows 10 and later)
- <img src="https://api.iconify.design/mdi:microsoft-windows.svg?color=%23ffffff"> [vrc-ytdlp-updater.bat](https://raw.githubusercontent.com/fiaKaiera/vrc-ytdlp-updater/refs/heads/main/vrc-ytdlp-updater.bat) (Right-click > Save Link As...)

<br><a href='https://ko-fi.com/fiaKaiera' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi1.png?v=6' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

### How to use:
1. Simply download the file, and run it.
2. Follow instructions found in the resulting window that appears.
3. If the process fails, try to run it as Administrator.

## What it does
1. Downloads the latest copy of [`yt-dlp.exe`](https://github.com/yt-dlp/yt-dlp) from the official Github page
2. Closes `vrchat.exe`, since it actively uses yt-dlp when there's a video player playing
3. Adds the `Read-only` attribute for `yt-dlp.exe`, and removes it from the old one
4. Renames your old version of yt-dlp inside VRChat's `LocalLow` folder

> [!NOTE]
> You can find the current version and backups which is likely at<br>`C:\Users\(YOUR USER FOLDER HERE)\AppData\LocalLow\VRChat\VRChat\Tools\`
> 
> If you need to quickly access the folder, simply enter Win+R and then enter this command: `%LOCALAPPDATA%Low\VRChat\VRChat\Tools`

## Removing `Read-only` on `yt-dlp.exe`
Removing `Read-only` allows for VRChat to update `yt-dlp.exe`.

1. Simply open "Run" (using `Win+R` keys) and paste the following command:
<br>`cmd /c attrib -r %LOCALAPPDATA%Low\VRChat\VRChat\Tools\yt-dlp.exe`
2. Press OK, and a command line window should appear for a fraction of a second.
3. Either restart VRChat or simply re-join the world you currently reside in.

Nothing sketchy here, the command simply removes the `Read-only` attribute on `yt-dlp.exe`.
- `cmd` is command prompt
- `/c` runs the following command
- `attrib` changes the attribute
- `-r` specifically removes `Read-only`
## Issues? Feature Requests?
Best report them through the [Issues](https://github.com/fiaKaiera/vrc-ytdlp-updater/issues) tab.
<br>If you are savvy enough, then you can try making a [pull request](https://github.com/fiaKaiera/vrc-ytdlp-updater/pulls) fixing the issue.
