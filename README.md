# dotfiles

[dotfiles](https://dotfiles.github.io/), managed with
[chezmoi](https://www.chezmoi.io/).

## Basic chezmoi workflow

Install dotfiles on a new machine:

```shell
chezmoi init git@github.com:moritzreiter/dotfiles.git
chezmoi diff
chezmoi apply
```

Then, the most used command are:

```shell
chezmoi add file    # add a new file to chezmoi
chezmoi re-add file # re-add a modified file
chezmoi cd          # change to git repository
chezmoi update      # pull changes from remote and apply
```
