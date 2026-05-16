if command -q tmux; and set -q TMUX
    set -l sock \
        (tmux show-environment SSH_AUTH_SOCK 2>/dev/null)

    set -gx SSH_AUTH_SOCK \
        (string replace 'SSH_AUTH_SOCK=' '' -- $sock)
end
