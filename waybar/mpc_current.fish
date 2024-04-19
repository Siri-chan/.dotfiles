#! /usr/bin/env fish

set -l playinfo = $(mpc current)

if test $(echo "$playinfo" | wc -c) -lt 35;
	echo $(mpc current)
else
	echo $(mpc current -f %title%)
end
