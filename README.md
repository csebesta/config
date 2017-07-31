# Dotfiles

These are configuration "dotfiles" for my personal computer. They can be installed manually or automatically using the setup.sh script. In both cases, GNU stow is required.

## Manual installation (recommended)

The configuration files can be installed via a simple stow command.

    stow DIRECTORY
    
## Automatic installation

The configuration files may also be installed automatically using the setup.sh script. Using this script is only recommended on new installations due to a lower likelihood of conflicts, and therefore deletions. The script will first attempt to clear the user's home directory of any broken symbolic links. The script will then proceed to stow the contents of each directory, deleting any conflicts interactively.

    ./setup.sh

The script will only prompt for confirmation before deleting symbolic links. To see a list of all broken symbolic links before executing the script, run this command.

    find -L $ HOME -type l
