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

if begin set -q TERM; and command --quiet --search fortune; end
  fortune oblique
end

# Starship prompt
if command --quiet --search starship
  starship init fish | source
end

