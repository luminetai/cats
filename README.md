![Cat Image](https://github.com/luminetai/cats/blob/main/cats.png)

The `cats` utility helps extract and provide relevant context about the file system structure, operating system, network, and user to facilitate better interactions with artificial intelligence, ensuring it can make more accurate and context-aware decisions during development.

# cats
A utility named after my little cats, who love cleaning up on my tables, shelves, and cabinets. They knock all the unnecessary things off onto the floor, leaving only the most important and useful ones. This utility works in the same way: it helps send only the necessary files and data to your clipboard, keeping your workflow clean and focused on the important parts of development.

Here’s how you can write it in English in your `README.md`:

## Installation and Usage

To install and run the `cats` program, execute the following command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/luminetai/cats/main/install.sh | bash
```

This command will automatically download and install the necessary files on your computer and create a symbolic link for easy access to the program.

Once installed, you can use the `cats` command to perform tasks.

## Help and Flags

The `cats` program accepts several flags that control its behavior. You can pass one, two, or even three flags in any order. If no flags are provided, the program will execute all actions by default.

### Available Flags:
- **D**: Get directory structure
- **N**: Get network information
- **S**: Get system information
- **U**: Get user information

### Usage Examples:

**Without flags**:  
Running the `cats` command without any flags will execute all available actions:
```bash
cats
```

**With a single flag**:  
You can pass a single flag to execute a specific action:
```bash
cats D
cats N
cats S
cats U
```

**With multiple flags**:  
You can pass multiple flags to execute different actions in any order:
```bash
cats DN
cats NS
cats UDS
```
