# launch tmux
# if interactive
# and tmux exists
# and not already in tmux
# and not in IntelliJ term
set --local run_tmux true
if test "$run_tmux" = true
    and status is-interactive
    and command --quiet --search tmux
    and not set --query TMUX
    and not set --query INTELLIJ_ENVIRONMENT_READER
    exec tmux new-session -A -s default
end

set fish_greeting ""

# vi mode, but with emacs shortcuts
set --global fish_key_bindings fish_hybrid_key_bindings

# configure cursor
set --global fish_cursor_default block blink
set --global fish_cursor_insert line blink
set --global fish_cursor_replace_one underscore blink
set --global fish_cursor_replace underscore blink
set --global fish_cursor_visual block blink

set --export EDITOR vim

set --export PYTHONSTARTUP ~/.config/python

# needed for pandoc mermaid-filter
set -gx PUPPETEER_EXECUTABLE_PATH "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

alias svim='sudo -E vim'
alias nv='nvim'

alias cm='chezmoi'

# show colors in `less`
set --export LESS -R

# nicer file listings with eza
if command --quiet --search eza
    alias ll="eza -l -g --icons --git"
    alias la="eza -la -g --icons --git"
    alias lt="eza -1 --icons --tree --git-ignore"
end

# tell a fortune
if status is-interactive
    and command --quiet --search fortune
    fortune programmer-quotes
end

# macOS only
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
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/moritz/.lmstudio/bin
# End of LM Studio CLI section

# launch starship
if command --quiet --search starship
    starship init fish | source
end

