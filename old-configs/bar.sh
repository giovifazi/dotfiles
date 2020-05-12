#!/bin/bash
SLOWREFR=30
MEDREFR=5
FASTREFR=.2

BORDERCOL="#ff000000"
BACKGRCOL="#ff222222"
TEXTCOL="#ffffffff"

killall -q lemonbar

clock () {
	TIME="$(date '+%Y-%m-%d %H:%M')"
	echo -n "$TIME"
}

battery () {
	PERCENT="$(cat /sys/class/power_supply/BAT0/capacity)"
	STATUS="$(cat /sys/class/power_supply/BAT0/status)"
	echo -ne "\uf242 $STATUS ""$PERCENT"'%'
}

volume () {
	MASTER="$(amixer get Master | grep -E "\[.+%\]"  | cut -d' ' -f 6)"
	MUTE="$(amixer get Master | grep -E "\[o.+\]" | rev | cut -d' ' -f1 | rev)"
	echo -n 'Volume '"$MUTE""$MASTER"
}

diskusage () {
    ROOT="$(df /dev/nvme0n1p6 | tail -1 | cut -d' ' -f 8)"
    HOME="$(df /dev/nvme0n1p7 | tail -1 | cut -d' ' -f 8)"
    echo -n "/ $ROOT  /home $HOME"
}

cpuload () {
	LOAD="$(ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}')"
	echo -n 'CPU %'"$LOAD"
}


network () {
	INTERFACES=$(ls /sys/class/net/ | grep -Ev 'lo')
	OUTPUT=""
	for if in $INTERFACES; do
		SSID=$(iwgetid -r "$if")
		OUTPUT+=" [$if : $SSID]"
	done
	echo -n "$OUTPUT"
}

workspaces () {
	USEDWS=$(i3-msg -t get_workspaces | grep -Po '"'"name"'"\s*:\s*"\K([^"]*)')
	CURRENTWS=$(i3-msg -t get_outputs | sed 's/.*"current_workspace":"\([^"]*\)".*/\1/')

	OUTPUT=""
	for i in $(seq 1 10); do
		if [[ ${CURRENTWS} -eq ${i} ]]; then
			OUTPUT+="%{F#ffafff26}|$i|"
		elif [[ $(echo ${USEDWS} | grep -w "${i}") != "" ]]; then
			OUTPUT+="%{F#ffffc4aa}|$i|"
		else
			OUTPUT+="%{F#ff454545}|$i|"
		fi
	done

	echo -n "$OUTPUT"
}

# left bar borders
(echo " " | lemonbar -d 1 -p -B"$BORDERCOL" -g 502x22+35+6 -f "Tamzen:size=14") &
# left bar
(
sleep .2
while true; do
	echo "%{l}$(network)"
	sleep "$MEDREFR";
done | lemonbar -d 1 -p -F"$TEXTCOL" -B"$BACKGRCOL" -g 500x20+36+7 -f "Tamzen:size=14"
) &


# center bar borders
(echo " " | lemonbar -d 1 -p -B"$BORDERCOL" -g 502x22+729+6 -f "Tamzen:size=14") &
# central bar
(
sleep .2
while true; do
	echo "%{c}$(clock) // $(battery) // $(cpuload)"
	sleep "$MEDREFR";
done | lemonbar -d 1 -p -F"$TEXTCOL" -B"$BACKGRCOL" -g 500x20+730+7 -f "Tamzen:size=14"
) &

# right bar borders
(echo " " | lemonbar -d 1 -p -B"$BORDERCOL" -g 202x22+1684+6 -f "Tamzen:size=14") &
# right bar
(
sleep .2
while true; do
	echo "%{c}$(volume)"
	sleep "$FASTREFR";
done | lemonbar -d 1 -p -F"$TEXTCOL" -B"$BACKGRCOL" -g 200x20+1685+7 -f "Tamzen:size=14"
) &

# bottombar borders
(echo " " | lemonbar -b -d 1 -p -B"$BORDERCOL" -g 502x22+729+6 -f "Tamzen:size=14") &
# bottombar
(
sleep .2
while true; do
	echo "%{c}$(workspaces)"
	sleep "$FASTREFR";
done | lemonbar -b -d 1 -p -F"$TEXTCOL" -B"$BACKGRCOL" -g 500x20+730+7 -f "Tamzen:size=14"
) &

# left bottombar borders
(echo " " | lemonbar -b -d 1 -p -B"$BORDERCOL" -g 302x22+35+6 -f "Tamzen:size=14") &
# left bottombar
(
    sleep .2
    while true; do
	      echo "%{c}$(diskusage)"
	      sleep "$SLOWREFR";
    done | lemonbar -b -d 1 -p -F"$TEXTCOL" -B"$BACKGRCOL" -g 300x20+36+7 -f "Tamzen:size=14"
) &
