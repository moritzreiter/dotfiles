if status is-interactive
and not set -q TMUX
and not [ $TERMINAL_EMULATOR = "JetBrains-JediTerm" ]
  exec tmux new-session -A -s default
end

set -g fish_key_bindings fish_hybrid_key_bindings

set -x EDITOR vim
set -x UNCRUSTIFY_CONFIG ~/.config/uncrustify

# Python
set -x PYTHONSTARTUP ~/.pythonrc
set -x PIP_REQUIRE_VIRTUALENV true
set -x VIRTUAL_ENV_DISABLE_PROMPT true

# Show colors in `less`
set -x LESS -r

alias svim='sudo -E vim'

set workDir (dirname (status -f))

# Load macOS specific stuff
if test (uname) = Darwin
  source $workDir"/config.macos.fish"
end

if begin
  test (hostname) = golem-pi3
  or test (hostname) = golem-pi-zero
end
  source $workDir"/config.ssh-keychain.fish"
end

set fish_greeting ""

if begin set -q TERM; and command --quiet --search fortune; end
  fortune oblique
end

if command --quiet --search eza
  alias ll="eza -l -g --icons --git"
  alias la="eza -la -g --icons --git"
  alias llt="eza -1 --icons --tree --git-ignore"
end

# Starship prompt
if command --quiet --search starship
  starship init fish | source
end

zoxide init fish | source

