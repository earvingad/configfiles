# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
import json
from libqtile.config import Key, Screen, Group, Drag, Click, Match
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

from typing import List  # noqa: F401

@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

mod = "mod4"

keys = [
    # Switch window focus to other pane(s) of stack
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Up", lazy.layout.up()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod, "control"], "space", lazy.layout.flip()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("st")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "q", lazy.window.kill()),
 
    Key([mod, "shift"], "q", lazy.spawn("sh /home/earving/.scripts/rofi-system.sh")),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),
    Key([mod], "space", lazy.spawn("rofi -show drun -theme simple")),
    Key([mod, "shift"], "space", lazy.spawn("rofi -show run -theme  simple.rasi -lines 7")),
    Key([mod, "shift"], "s", lazy.spawn("rofi -show drun -theme drun-full")),
    # Change the volume if our keyboard has keys
    Key([], "XF86AudioRaiseVolume",lazy.spawn("sh /home/earving/.scripts/volcontrolpulse.sh -u")),
    Key([], "XF86AudioLowerVolume",lazy.spawn("sh /home/earving/.scripts/volcontrolpulse.sh -d")),
    Key([], "XF86AudioMute",lazy.spawn("sh /home/earving/.scripts/volcontrolpulse.sh -m")),
    Key([], "XF86AudioPlay",lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext",lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev",lazy.spawn("playerctl previous")),
    Key([], "XF86TouchpadToggle",lazy.spawn("sh /home/earving/.scripts/toggletouchpad.sh")),
    Key([], "Print",lazy.spawn("sh /home/earving/.scripts/screenshot.sh -u")),
    Key([mod], "Print",lazy.spawn("sh /home/earving/.scripts/screenshot.sh -d")),
    # && notify-send 'screen shot taken' -i checkbox-symbolic"
    # backlight controls
    Key([], "XF86MonBrightnessUp", lazy.spawn("sh /home/earving/.scripts/brilllocontrol.sh -u")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("sh /home/earving/.scripts/brilllocontrol.sh -d")),
 ]

groups = [
    Group("1",label="WWW",),
    Group("2",label="CHAT"),
    Group("3",matches=[Match(wm_class=["Spotify"])],label="MUS"),
    Group("4",matches=[Match(wm_class=["Popcorn-Time"])],label="VID"),
    Group("5",label="DEV"),
    Group("6",label="DOC"),
    ]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])


# pull pywal colors from cached template
pykolors = os.path.expanduser('~/.cache/wal/colors.json')

# parse pywal json file into python format
kolors = json.loads(open(pykolors).read())

# list of colors from json file - to be placed in qtile
colors=[
[kolors['colors']['color0']], 
[kolors['colors']['color1']], 
[kolors['colors']['color2']], 
[kolors['colors']['color3']], 
[kolors['colors']['color4']], 
[kolors['colors']['color5']], 
[kolors['colors']['color6']], 
[kolors['colors']['color7']], 
[kolors['colors']['color8']], 
[kolors['colors']['color9']], 
[kolors['colors']['color10']],
[kolors['colors']['color11']],
[kolors['colors']['color12']],
[kolors['colors']['color13']],
[kolors['colors']['color14']],
[kolors['colors']['color15']]
]

layouts = [
    layout.MonadTall(border_focus ='#4c8ec3',
                     border_normal='#100a15',
                     border_width = 2,
                     margin = 1
                    ),
    layout.Max(),
    # layout.Stack(num_stacks=2),
    layout.Floating(border_focus ='#4c8ec3',
                     border_normal='#100a15',
                     border_width = 2,
                     margin = 5
                    ),
    # layout.Bsp(border_focus ='#4c8ec3',
    #                  border_normal='#100a15',
    #                  border_width = 2,
    #                  margin = 5
    #                 )
]
### Functions ###
def get_kb_layout():
    output = subprocess.run(
        ["sh", "/home/earving/.scripts/bar/keyboardlayout.sh"],
        capture_output=True,
        encoding="utf-8"
    ).stdout
    return output

def open_calendar(qtile):
    qtile.cmd_spawn('gsimplecal')

widget_defaults = dict(
    font='SauceCodePro Nerd Font',
    fontsize=12,
    padding=2,
    background=colors[0]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [   widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.GroupBox(font="Ubuntu Bold",
                        fontsize = 10,
                        margin_y = 3,
                        margin_x = 0,
                        padding_y = 5,
                        padding_x = 5,
                        borderwidth = 0,
                        active = colors[7],
                        inactive = colors[8],
                        rounded = False,
                        highlight_method = "block",
                        this_current_screen_border = colors[4],
                        this_screen_border = colors [5],
                        other_current_screen_border = colors[0],
                        other_screen_border = colors[0],
                        foreground = colors[7],
                        background = colors[0]
                    ),
                widget.Prompt(
                        font="Ubuntu Bold",
                        padding=10,
                        foreground = colors[7],
                        background = colors[1]
                    ), 
                widget.WindowName(font='Ubuntu Bold',
                     fontsize=10,
                     foreground=colors[7]),
                # widget.TextBox(
                #         text='',
                #         background = colors[0],
                #         foreground = colors[8],
                #         padding=-5,
                #         fontsize=37,
                #         ),
                widget.TextBox(
                        text="♫",
                        padding = 4,
                        foreground=colors[0],
                        background=colors[8],
                        fontsize=14
                        ),
                widget.Mpris2(
                        name='spotify',
                        objname="org.mpris.MediaPlayer2.spotify",
                        display_metadata=['xesam:title', 'xesam:artist'],
                        scroll_chars=None,
                        stop_pause_text='',
                        font='System Font',
                        padding = 2,
                        background = colors[8],
                        foreground = colors[7],
                        ),
                widget.Mpris2(
                        name='clementine',
                        objname="org.mpris.MediaPlayer2.clementine",
                        display_metadata=['xesam:title', 'xesam:artist'],
                        stop_pause_text='',
                        font='System Font',
                        padding = 2,
                        background = colors[8],
                        foreground = colors[7]
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.Battery(format='{char}{percent:2.0%}',
                        font='Ubunto Mono',
                        charge_char="↯",
                        discharge_char="",
                        padding = 3,
                        foreground=colors[0],
                        background=colors[7]),
                widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.Net(
                        format='{down} ↓↑ {up}',
                        interface = "wlp1s0",
                        font='Ubunto Mono',
                        foreground = colors[0],
                        background = colors[4],
                        padding = 5,
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                # widget.TextBox(
                #         text="☵",
                #         padding = 5,
                #         foreground=colors[0],
                #         background=colors[5],
                #         fontsize=12
                #         ),
               widget.CurrentLayoutIcon(
                        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                        foreground = colors[0],
                        background = colors[5],
                        padding = 0,
                        scale=0.7
                        ),
                widget.CurrentLayout(
                        foreground = colors[0],
                        background = colors[5],
                        font='Ubuntu Mono',
                        padding = 5
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.TextBox(
                        text="⌨",
                        padding = 2,
                        foreground=colors[0],
                        background=colors[11],
                        fontsize=12
                        ),
                widget.GenPollText(
                        foreground=colors[0],
                        background=colors[11],
                        padding = 5,
                        func = get_kb_layout,
                        update_interval=1
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.TextBox(
                        text='',
                        background = colors[6],
                        foreground = colors[0],
                        padding = 5
                        ),
                widget.Volume(
                        font='Ubunto Mono',
                        foreground = colors[0],
                        background = colors[6],
                        padding = 5
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[7],
                        background = colors[0]
                        ),
                widget.TextBox(
                        text=" ",
                        foreground=colors[0],
                        background=colors[13],
                        padding = 6,
                        fontsize=12
                        ),
                widget.Clock(format='%a, %d | %H:%M',
                        font='Ubunto Mono',
                        foreground=colors[0],
                        background=colors[13],
                        mouse_callbacks={'Button1': open_calendar}
                        ),
                widget.Systray(
                        foreground=colors[7],
                        background=colors[0]
                        ),
                widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[7],
                        background = colors[0]
                        ),
            ],
            background=colors[0],opacity=0.9, size=20,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wmclass': 'gsimplecal'},
    {'wmclass': 'feh'},
])
auto_fullscreen = True
focus_on_window_activation = "smart"


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"
