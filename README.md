# My dotfiles

These are my pontofiles. The main 'feature' is dynamic colouring with wal
(with polybar & xmonad integration). I use arch.

## Colorschemes

I use pywal's colorscheme with xmonad, dmenu and polybar.
Polybar colors are loaded from xrdb, but the palette of xmonad workspaces and
the currently focused window (sent through dbus from xmonad to polybar) are in
the xmonad config.

## Vim

I pratically use it as an IDE, with autocomplete, fixing, smooth scrolling among
other things.

## Scripts

Wallpaper changer scripts which compile and restart everything for a seamless wallpaper
transition.
Some utility scripts (start recording, websearching, etc ...).
Most of them have polybar integration (ex: recording icon)

## Xmonad

Dynamic workspaces, scratchpads and various layouts.
Disclaimer: I worse than iliterate when it comes to haskell.

## Pywal and Xmonad compatibility

Dbus is used to sync xmonad with pywal. Check https://github.com/troydm/xmonad-dbus

haskell-dbus xmonad-log

# Instalation

## Font

[Hacker Nerd Font](https://aur.archlinux.org/packages/nerd-fonts-hack/)

## Wal templates

Paste them to template folder, located in your pywal install.
Mine is in /lib/python3.9/site-packages/pywal/templates/

# Xmonad, Vim

Plug and play
