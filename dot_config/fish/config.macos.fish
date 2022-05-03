# Hombebrew
eval (/opt/homebrew/bin/brew shellenv)

# Locale
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Python
alias pip='pip3'

# PlantUML
set -x GRAPHVIZ_DOT (which dot)

# Handy aliases
alias launchpad-reset='defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'
alias net-listening='lsof -i TCP -s TCP:LISTEN -nP'
alias proc-monitor='top -o cpu -stats pid,command,cpu,mem,time,threads,state'
alias net-monitor-wired='nettop -d -P -J bytes_in,bytes_out -t wired'
alias net-monitor-wifi='nettop -d -P -J bytes_in,bytes_out -t wifi'

