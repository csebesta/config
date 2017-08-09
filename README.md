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

The primary script for configuring the system. It consists of 5 parts.

### 1. Adding ppas

The script will prompt for confirmation before installing each ppa defined in the script. Afterwards, the script will automatically update the repositories.

### 2. Installing packages

The script will promt for confirmation before installing each package defined in the script.

### 3. Creating the homelab

The script will prompt for confirmation before installing each package defined in the script. This will install packages that are userful for homelab operation.

### 4. Disable guest account

The script will prompt for confirmation before adding files to the directory /etc/lightdm/lightdm.conf.d/. These files will 1) disable the guest account 2) hide the list of users in the greeter 3) force manual login.

### 5. Adjust gtk settings

The script will prompt for confirmation before making simple visual changes to unity. The script will 1) install the numix theme and icons (The ppa must be installed first) 2) disable overlay scrollbars, which can cause conflicts with the numix theme 3) set the gtk theme and icons to numix 4) adjust the visual style of the lockscreen.
