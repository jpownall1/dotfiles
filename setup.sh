#!/usr/bin/env bash
set -e # Exit immediately if a command fails

echo "Initialising dotfiles setup..."

# Install Oh My Zsh (Unattended mode to prevent script blocking)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing Oh My Zsh..."
    RUNZSH=no CHSH=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install NVM and Node LTS
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM & Node LTS..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    
    # Load NVM temporarily in this script to install Node immediately
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install --lts
    nvm alias default 'lts/*'
fi

# Install uv (Fast Python package installer)
if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    
    # uv automatically adds itself to the path in .zshrc, 
    # but we can source it immediately for the current session
    source $HOME/.local/bin/env
fi

# Remove existing configs and create symlinks
echo "Creating symlinks..."
rm -f ~/.zshrc ~/.p10k.zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh

echo "Setup complete! Restart your terminal or run 'exec zsh'."