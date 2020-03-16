#!/bin/bash
file="/tmp/neomutt-$RANDOM.txt"
cat > $file
termcmd=terminator
termflag=-x

home=`realpath ~`
$termcmd $termflag $home/.config/neomutt/scripts/openvim.sh $file
