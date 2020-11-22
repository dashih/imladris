# Configuring VNC
VNC is notoriously difficult to configure.

## Instructions
1. `sudo yum/dnf install tigervnc-server`
2. Setup and test run VNC as your user
    1. `vncpasswd` - Set your password
    2. `vncserver :1`
    3. `vncserver -kill :1` 
3. Set up VNC with systemd (as root)
    1. `cp /lib/systemd/system/vncserver@.service /etc/systemd/system`
    2. Follow instructions to customize
    3. `systemctl daemon-reload`
    4. `systemctl start vncserver@:1.service`

## Troubleshooting
The above instructions rarely without some fixing.

### Cleaning up
When VNC fails to start, it will often leave behind processes, PID files, sockets, etc. Follow these instructions to clean up.

1. Run `vncserver -list` everywhere (any user including root that you were trying to set up). Kill any instances with `vncserver -kill`.
2. Delete socket files from /tmp, e.g. `X1-lock` and `.X11-unix/X1`
3. Manually kill any vncserver processes

### Tweak xstartup
If you're running a weird desktop (lxqt) or even just some issue with KDE, you may need to tweak `~/.vnc/xstartup`. When there are issues with the startup commands, they can manifest as strange errors when trying to boot vncserver. Use Google to figure out which commands work.

### Resolution
`vncserver -geometry 1920x1080`
`xrandr -s 1920x1080`
