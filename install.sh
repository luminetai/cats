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

# Ensure the cats.sh file exists
if [ ! -f "$PROJECT_DIR/cats.sh" ]; then
    echo "cats.sh script is missing. Something went wrong with the cloning process."
    exit 1
fi

# Adding alias to .bashrc or .zshrc
SHELL_CONFIG_FILE="$HOME/.bashrc"
if ! grep -q "alias cats" "$SHELL_CONFIG_FILE"; then
    echo "alias cats='$PROJECT_DIR/cats.sh'" >> "$SHELL_CONFIG_FILE"
    echo "Alias 'cats' added to $SHELL_CONFIG_FILE"
else
    echo "Alias 'cats' already exists."
fi

# Making the cats.sh script executable
echo "Adding execution permissions to the cats.sh script..."
chmod +x "$PROJECT_DIR/cats.sh" && echo "Permissions added successfully." || { echo "Failed to add execution permissions."; exit 1; }

# Instructions for applying the alias
echo "Restart the terminal or run 'source ~/.bashrc' to apply the alias."
echo "Now you can use the 'cats' command in the terminal."