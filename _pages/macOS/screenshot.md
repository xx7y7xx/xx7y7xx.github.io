---
permalink: /macos/screenshot.html
title: macOS screenshot
layout: page
---

## Env

OS: macOS 15.3.2
Year: 2025

## Method 1: cron

Create a shell script `~/bin/screenshot_cron.sh`.

```sh
# call from cron (crontab -e)
/usr/sbin/screencapture -x /Users/devin.chenyang/Desktop/pic_cron/screenshot_$(date +%Y%m%d%H%M%S).png
```

Add to crontab

```sh
$ crontab -l
* * * * * /Users/devin.chenyang/bin/screenshot_cron.sh
```

Add these binary to System Settings => Privacy => Screen

- `/usr/sbin/cron`
- `/usr/bin/crontab`
- [Optional] `/bin/sh`

## Method 2: plist with inline script

Create a new plist file `~/Library/LaunchAgents/com.user.screenshotinlineshell.plist`

```xml
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.screenshotinlineshell</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/sh</string>
        <string>-c</string>
        <string>/usr/sbin/screencapture -x "/Users/devin.chenyang/Desktop/pic_screenshotinlineshell_plist/screenshot_$(date +%Y%m%d%H%M%S).png"</string>
    </array>
    <key>StartInterval</key>
    <integer>60</integer>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```

Load this plist file

```sh
$ launchctl load ~/Library/LaunchAgents/com.user.screenshotinlineshell.plist
```

Add `/bin/sh` to System Settings => Privacy => Screen

## Method 3: plist with script file

Create a new plist file `~/Library/LaunchAgents/com.user.screenshotsh.plist`

```xml
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.screenshotsh</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Users/devin.chenyang/bin/screenshot_plist.sh</string>
    </array>
    <key>StartInterval</key>
    <integer>60</integer>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```

Create a new shell script `~/bin/screenshot_plist.sh`

```sh
# call from plist ~/Library/LaunchAgents/com.user.screenshotsh.plist
/usr/sbin/screencapture -x /Users/devin.chenyang/Desktop/pic_plist/screenshot_$(date +%Y%m%d%H%M%S).png
```

Add `/bin/sh` to System Settings => Privacy => Screen
