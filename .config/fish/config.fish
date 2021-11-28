fish_add_path $HOME/.local/bin
source $HOME/.config/aliases.fish
export _JAVA_AWT_WM_NONREPARENTING=1
export LD_LIBRARY_PATH=/usr/local/lib


if status is-interactive
    # Commands to run in interactive sessions can go here
    # Get wal's colors
    cat ~/.cache/wal/sequences &
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
