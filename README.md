# Dotfiles for Ubuntu 16.04

These are configuration "dotfiles" for my personal computer. They can be installed manually or automatically via the included scripts. GNU stow is required to complete this process.

    cd ~/
    git clone https://github.com/csebesta/dotfiles
    mv dotfiles/ .dotfiles/

This configuration has been tested ONLY on Ubuntu 16.04, and is not guaranteed to work with other distributions.

## Manual installation

Configuration files for specific programs can be installed via a simple stow command.

    cd ~/.dotfiles
    stow DIRECTORY
    
## Automatic installation

In order to speed up the process of installation and configuration of Ubuntu 16.04, the two scripts in the main directory can be used. These scripts are primarily intended to be executed on a new installation of Ubuntu 16.04, though they ought to work in other cases as well. The process is as follows.

    cd ~/.dotfiles
    ./postinstall.sh
    ./setup.sh

###### Note

The setup.sh script will only prompt for confirmation once before deleting all broken symbolic links. To see a list of broken symbolic links before executing the script, run this command.

    find -L ~/ -type l
    
# Details

## postinstall.sh
