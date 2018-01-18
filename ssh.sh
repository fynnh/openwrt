#!/bin/sh
# This script assumes that instructions in OpenC2X/README.txt have been followed
SESSION=ssh_proxy


tmux -2 new-session -d -s $SESSION


tmux set-option -g mouse

tmux new-window -t $SESSION:1 -n 'App'

tmux split-window -h
tmux select-pane -t 0

tmux send-keys "ssh -L 8080:192.168.0.98:8080 fynn.hauptmeier@ccs-aqua.cs.upb.de" C-m
tmux split-window -v
tmux send-keys "ssh -L 9980:192.168.0.98:9980 fynn.hauptmeier@ccs-aqua.cs.upb.de" C-m
tmux select-pane -t 2
tmux send-keys "ssh -L 9922:192.168.0.98:9922 fynn.hauptmeier@ccs-aqua.cs.upb.de" C-m
tmux split-window -v
tmux send-keys "ssh -L 8022:192.168.0.98:22 fynn.hauptmeier@ccs-aqua.cs.upb.de" C-m
tmux split-window -v
tmux send-keys "ssh -L 1188:192.168.0.98:1188 fynn.hauptmeier@ccs-aqua.cs.upb.de" C-m
tmux -2 attach-session -t $SESSION
