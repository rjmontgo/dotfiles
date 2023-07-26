# Dotfiles

I use gnu stow to create symlinks to the `~/.config` directory, 
since many other programs use that to store their configuration
I pull these out to ensure that it's easy to locate the configurations
for programs that I would like to manage instead of Nix.


## Usage

In order to simplify un-stowing and restowing I have a Makefile that just runs
the restow into my .config file. So all I need to do is run `make` to link everything
the way I want.

There is a `stow-local-ingore` to prevent it from linking the Makefile into the `~/.config`
folder.

