# Hombebrew
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

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

