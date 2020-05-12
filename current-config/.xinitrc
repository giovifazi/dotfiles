# this file is executed with startx or xinit, basically when X starts

# xkbmap reset (just to be sure to clear junk)
setxkbmap -option

# make capslock behave like ctrl and disable capslock
setxkbmap -option ctrl:nocaps

# make short-pressed ctrl behave like escape
xcape -e 'Control_L=Escape'

# randr monitor view
bash /home/giovi/.config/screenlayout/layout.sh

# start window manager
exec i3
