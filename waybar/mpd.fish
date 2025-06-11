#!/usr/bin/env fish
if mpc current | grep . >/dev/null 2>&1
	if mpc | rg "playing" >/dev/null 2>&1
		printf "󰐊 "
	else if mpc | rg -c "paused" >/dev/null 2>&1
		printf "󰏤 "
	else
		printf ""
	end
	mpc current | head -n 1
end
