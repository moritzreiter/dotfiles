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

######################
# fish customization #
######################

set fish_greeting ""

# vi mode, but with emacs shortcuts
set --global fish_key_bindings fish_hybrid_key_bindings

# configure cursor
set --global fish_cursor_default block blink
set --global fish_cursor_insert line blink
set --global fish_cursor_replace_one underscore blink
set --global fish_cursor_replace underscore blink
set --global fish_cursor_visual block blink

#############################
# environment customization #
#############################

alias nv='nvim'
alias svim='sudo -E vim'
alias cm='chezmoi'

set --export EDITOR vim

set --export PYTHONSTARTUP ~/.config/python

# tell a fortune
if status is-interactive
    and command --quiet --search fortune
    fortune programmer-quotes
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/moritz/.lmstudio/bin
# End of LM Studio CLI section

# launch starship
if command --quiet --search starship
    starship init fish | source
end

