# tmux please, but not in a JetBrains terminal
if status is-interactive
    and command --quiet --search tmux
    and not set -q TMUX
    and [ "$TERMINAL_EMULATOR" != JetBrains-JediTerm ]
    exec tmux new-session -A -s default
end

# fish
set -g fish_key_bindings fish_hybrid_key_bindings
set fish_greeting ""

set -x EDITOR vim
set -x PYTHONSTARTUP ~/.config/python

alias svim='sudo -E vim'
alias n='nvim'

# show colors in `less`
set -x LESS -R

# nicer file listings with eza
if command --quiet --search eza
    alias ll="eza -l -g --icons --git"
    alias la="eza -la -g --icons --git"
    alias llt="eza -1 --icons --tree --git-ignore"
end

if command --quiet --search zoxide
    zoxide init fish | source
end

# tell a fortune
if begin
        status is-interactive; and command --quiet --search fortune
    end
    fortune programmer-quotes
end

# launch starship
if command --quiet --search starship
    starship init fish | source
end

# pnpm
set -gx PNPM_HOME /Users/moritz/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
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
