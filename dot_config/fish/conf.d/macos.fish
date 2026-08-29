if test (uname) = Darwin
    # Locale
    set -x LC_ALL en_US.UTF-8
    set -x LANG en_US.UTF-8

    # PlantUML
    set -x GRAPHVIZ_DOT (which dot)

    # Handy aliases
    alias launchpad-reset='defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'
    alias net-listening='lsof -nP -i TCP -s TCP:LISTEN'
    alias proc-monitor='top -o cpu -stats pid,command,cpu,mem,time,threads,state'
    alias net-monitor-wired='nettop -dP -J bytes_in,bytes_out -t wired'
    alias net-monitor-wifi='nettop -dP -J bytes_in,bytes_out -t wifi'

    # needed for pandoc mermaid-filter
    set -gx PUPPETEER_EXECUTABLE_PATH "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
end

