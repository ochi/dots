alias current_energy="echo \"(`cat /sys/class/power_supply/BAT0/energy_now` / `cat /sys/class/power_supply/BAT0/energy_full`) * 100\" | bc -l | cut -d'.' -f1"
