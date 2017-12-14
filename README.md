# garden-workstations

## First-time usage

1. Clone this repo.
1. macOS only: uninstall shiftit, iterm, any other cask apps listed in the casks of macos.yml.
1. `<garden-workstations>/run.sh`

## Linux post-install

1. Do the things in common post-install below.

## macOS post-install

1. Open Keyboard preferences > Shortcuts > Input Sources > untick "Select the previous input source" (or whatever is stealing ctrl+space from our tmux config)
1. Do the things in common post-install below.

## Common post-install

1. Reload tmux and shell.
1. Install TPM plugins (in tmux press prefix+I).
1. `ruby-install` yourself a Ruby version.

## TODO

1. git autocomplete in bash
1. Unify tmux configs? It looks like that TPM plugin is cross-platform.
1. tmate config that works.
1. tmate on linux
1. automate installation of Ruby in run.sh based on `.ruby-version`.
1. macOS key repeat (this is a bit of a pain to automate as valid defaults vales changed between el capitan and sierra. Might not even be worth automating)
1. macOS hide-the-dock
1. proper alt key behaviour in iterm: preferences -> profiles -> default profile -> keys -> left option key acts as +Esc.
1. rethink PS1 (do we need that watch emoji and ruby version?)
1. gems: bundler, bosh_cli
