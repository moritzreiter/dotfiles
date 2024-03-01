# tmux please, but only if not in JetBrains terminal
if status is-interactive
    and not set -q TMUX
    and [ "$TERMINAL_EMULATOR" != JetBrains-JediTerm ]
    exec tmux new-session -A -s default
end

# fish
set -g fish_key_bindings fish_hybrid_key_bindings
set fish_greeting ""

set -x EDITOR vim
set -x PYTHONSTARTUP ~/.config/python


# show colors in `less`
set -x LESS -r

alias svim='sudo -E vim'
alias n='nvim'

set workDir (dirname (status -f))

# Load macOS specific config
if test (uname) = Darwin
    source $workDir"/config.macos.fish"
end

# load host specific config
if begin
        test (hostname) = golem-pi3
        or test (hostname) = golem-pi-zero
    end
    source $workDir"/config.ssh-keychain.fish"
end

# nicer file listings with eza
if command --quiet --search eza
    alias ll="eza -l -g --icons --git"
    alias la="eza -la -g --icons --git"
    alias llt="eza -1 --icons --tree --git-ignore"
end

# tell a fortune
if begin
        set -q TERM; and command --quiet --search fortune
    end
    fortune oblique
end

# launch starship
if command --quiet --search starship
    starship init fish | source
end

zoxide init fish | source

# pnpm
set -gx PNPM_HOME /Users/moritz/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
