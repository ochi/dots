alias current_energy="echo \"(`cat /sys/class/power_supply/BAT0/energy_now` / `cat /sys/class/power_supply/BAT0/energy_full`) * 100\" | bc -l | cut -d'.' -f1"

function tmx {
    tmux start-server
    tmux new-session -d -s development   -n multitail
    tmux new-window     -t development:2 -n devbox
    tmux new-window     -t development:3 -n performer
    tmux new-window     -t development:4 -n watchers

    tmux send-keys -t development:1 "multitail -sw 175,4 -wh 20 -s 2 -i /var/log/apache2/error.log -i /var/log/php/error.log -wh 50 -i /var/www/minefield/enterprise/Emma2/app/logs/dev.log -i /var/www/minefield/enterprise/Emma2/app/logs/prod.log" C-m C-O
    tmux send-keys -t development:2 "cd /var/www/minefield/enterprise" C-m C-l
    tmux send-keys -t development:3 "cd ~" C-m C-l
    tmux send-keys -t development:4 "cd ~" C-m C-l

    tmux select-window -t development:2
    tmux attach-session -t development
}
