# My Dotfiles

This repository contains my global terminal configuration files, allowing me to synchronise my setup across multiple machines.

## Prerequisites

Before setting this up on a new machine, ensure the following are installed:
1. [Zsh](https://zsh.sourceforge.io/)
2. [Oh My Zsh](https://ohmyzsh.github.io/)
3. [Powerlevel10k](https://github.com/romkatv/powerlevel10k) 

## Installation

To replicate this environment on a new machine, open the terminal and execute the following commands:

```bash
# 1. Clone this repository into your home directory
git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git) ~/dotfiles

# 2. Make sure omzsh and Powerlevel10k theme is downloaded
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 2. Remove any existing default configuration files
rm -f ~/.zshrc ~/.p10k.zsh

# 3. Symlink the repository files to your home directory
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh

# 4. Reload the shell
source ~/.zshrc
```

## Adding New Files
To add new configurations (e.g., .gitconfig) to this repository in the future:
1. Move the file here: mv ~/.gitconfig ~/dotfiles/
2. Create the symlink: ln -s ~/dotfiles/.gitconfig ~/.gitconfig
3. Update this README.md
4. Commit and push the changes.
