# Checking for git
if ! command -v git &>/dev/null; then
    echo "Git is not installed! Please install git."
    exit 1
fi

# Hidden directory for cloning (instead of $HOME/cats we use $HOME/.cats)
PROJECT_DIR="$HOME/.cats"

# Removing old directory .cats if it exists
if [ -d "$PROJECT_DIR" ]; then
    echo "Removing old directory $PROJECT_DIR..."
    rm -rf "$PROJECT_DIR"
fi

# Cloning the project
echo "Cloning repository from GitHub..."
git clone https://github.com/luminetai/cats.git "$PROJECT_DIR" && echo "Repository successfully cloned." || { echo "Error cloning repository."; exit 1; }

# Adding alias to .bashrc or .zshrc
SHELL_CONFIG_FILE="$HOME/.bashrc"
if ! grep -q "alias cats" "$SHELL_CONFIG_FILE"; then
    echo "alias cats='$PROJECT_DIR/cats.sh'" >> "$SHELL_CONFIG_FILE"
    echo "Alias 'cats' added to $SHELL_CONFIG_FILE"
else
    echo "Alias 'cats' already exists."
fi

# Making the cats.sh script executable
chmod +x "$PROJECT_DIR/cats.sh"

# Instructions for applying the alias
echo "Restart the terminal or run 'source ~/.bashrc' to apply the alias."
echo "Now you can use the 'cats' command in the terminal."