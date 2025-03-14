# cats
A utility inspired by the playful nature of little cats, who love knocking things off shelves. Similarly, this tool helps send files directly to your clipboard, simplifying and improving your workflow.

Here’s how you can write it in English in your `README.md`:

```markdown
## Installation and Usage

To install and run the `cats` program, execute the following command in your terminal:

```bash
bash -c "$(curl -fsSL https://github.com/luminetai/cats/raw/main/install.sh)"
```

This command will automatically download and install the necessary files on your computer and create a symbolic link for easy access to the program.

Once installed, you can use the `cats` command to perform tasks.

### Usage Examples

**By default**, to copy the content of the files listed in `.catsread` to the clipboard:

  ```bash
  cats
  ```

**With the `-r` flag**, to create `.catsread` before copying the content of the files:

  ```bash
  cats -r /path/to/directory
  ```

**With the `-w` flag**, to skip creating `.catsread`:

  ```bash
  cats -w /path/to/directory
  ```

For additional help, use the command:

```bash
cats --help
```
```
