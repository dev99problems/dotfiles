# TMUX 3.0 installation

## Preface

`ncurses` framework - [context](https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/intro.html)

[how to produce tmux-256colors](for TMUX3.0 https://uare.github.io/2021/setup-tmux-on-mac-os)

## Guide

For some reason, `tmux` 3.0 which is installed via `brew` is not
working with `kitty` and colors properly out of the box in my setup,
especially with `nvim` and `tmux-256colors`.

So you need to regenerate `term info` database with latest `ncurses`.

**To do so, do the following:**
* check ncurses `which -a tic`
* download the latest version of ncurses:
  `curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz`
* enter `~/.local/share/terminfo/74/` folder or create it with `mkdir -p terminfo/74`
* renegarete terminal info with `/usr/bin/tic -xe tmux-256color terminfo.src` command

