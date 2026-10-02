# nicer file listings with eza
if command --quiet --search eza
    alias ll="eza -l -g --icons --git"
    alias la="eza -la -g --icons --git"
    alias lt="eza -1 --icons --tree --git-ignore"
end

