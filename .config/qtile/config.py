import os
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = 'alacritty'
browser = 'brave'

# Colors
black = ['#32344a', '#444b6a']
red = ['#f7768e', '#ff7a93']
green = ['#9ece6a', '#b9f27c']
yellow = ['#e0af68','#ff9e64']
blue = ['#7aa2f7', '#7da6ff']
magenta = ['#ad8ee6', '#bb9af7']
cyan = ['#449dab', '#0db9d7']
white = ['#9699a8', '#acb0d0']

widget_defaults = dict(
    font = "Hack Bold",
    fontsize = 12,
    padding = 20,
    background = black[0]
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top = bar.Bar([ 
            widget.Sep(
                linewidth = 0,
                padding = 15
                ),
            widget.Clock(
                foreground = yellow[1],
                format = "%H:%M",
                font = 'Hack Bold',
                padding = 0
                ),
            widget.TextBox(
                foreground = yellow[1],
                font = 'Hack',
                text = ' - ',
                padding = 0
                ),
            widget.Clock(
                foreground = yellow[1],
                font = 'Hack',
                format = '%A %d.%m',
                padding = 0
                ),
            widget.Sep(
                linewidth = 0,
                padding = 15
                ),
            widget.GroupBox(
                font = "Hack Bold",
                fontsize = 11,
                margin_y = 3,
                margin_x = 0,
                padding_y = 5,
                padding_x = 3,
                borderwidth = 3,
                active = cyan[1],
                inactive = white[1],
                rounded = False,
                highlight_color = black[0],
                highlight_method = "line",
                this_current_screen_border = cyan[0],
                foreground = white[0],
                background = black[0]
                ),
            widget.WindowName(
                foreground = magenta[0],
                background = black[0],
                font = 'Hack',
                ),
            widget.CurrentLayout(
                foreground = red[1],
                fmt = ': {}',
                ),
            widget.Battery(
                foreground = green[1],
                format = ': {percent:2.0%}',
                update_delay=60,
                ),
            widget.Volume(
                foreground = yellow[1],
                fmt = '墳: {}',
                ),
            widget.Wlan(
                foreground = blue[1],
                interface = 'wlp2s0',
                format = ': {essid}',
                mouse_callbacks = {'Button3': lambda: qtile.cmd_spawn(terminal + 'nmtui')},
                ),
            widget.CheckUpdates(
                foreground = magenta[1],
                colour_have_updates = cyan[1],
                colour_no_updates = cyan[1],
                mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')},
                ),
            ],
            30,
            opacity=0.9,
        ),
    ),
]
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    # Useful wm shortcuts
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"), # Toggle between different layouts as defined below
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Shortcuts to run applications
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "r", lazy.spawn('rofi -show run'), desc="Run rofi -show run"),
    Key([mod], 'b', lazy.spawn(browser), desc='Launch browser'),

    # Set brightness keys
    Key([], 'XF86MonBrightnessUp', lazy.spawn('sudo brillo -A 20')),
    Key([], 'XF86MonBrightnessDown', lazy.spawn('sudo brillo -U 20')),

    # Set volume keys
    Key([], 'XF86AudioRaiseVolume', lazy.spawn('pactl set-sink-volume 0 +5%')),
    Key([], 'XF86AudioLowerVolume', lazy.spawn('pactl set-sink-volume 0 -5%')),
    Key([], 'XF86AudioMute', lazy.spawn('pactl set-sink-mute 0 toggle')),
]

groups = [Group(i) for i in "12345"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

layout_theme = {
        'border_width': 2,
        'margin': 0,
        'border_focus': 'e1acff',
        'border_normal': '1d2330'
        }

layouts = [
    layout.Columns(**layout_theme),
    layout.Max(**layout_theme),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
