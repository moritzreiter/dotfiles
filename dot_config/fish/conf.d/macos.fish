if test (uname) = Darwin
    # locale
    set --export LC_ALL en_US.UTF-8
    set --export LANG en_US.UTF-8

    # plantUML
    set --export GRAPHVIZ_DOT (which dot)

    # aliases
    alias net-listening='lsof -nP -i TCP -s TCP:LISTEN'
    alias proc-monitor='top -o cpu -stats pid,command,cpu,mem,time,threads,state'
    alias net-monitor-wired='nettop -dP -J bytes_in,bytes_out -t wired'
    alias net-monitor-wifi='nettop -dP -J bytes_in,bytes_out -t wifi'

    set --export HOMEBREW_NO_ENV_HINTS 1

    # needed for pandoc mermaid-filter
    set -gx PUPPETEER_EXECUTABLE_PATH "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
end

