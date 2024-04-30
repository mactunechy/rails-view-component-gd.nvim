# rails-view-component-gd.nvim

This is a Neovim plugin designed to perform "Go to Definition" functionality in Rails ERB and Slim templates.

## How it works

The plugin is written in Lua and resides in the `rails-view-component-gd` directory. It uses Neovim's built-in LSP (Language Server Protocol) to provide "Go to Definition" functionality. When you're in an ERB or Slim file and you trigger the plugin via a keyboard shortcut, it will navigate to the definition of the component under your cursor.

## Installation

To install the plugin, you need to have Neovim 0.5 or later. You can then use your favorite plugin manager. Here's an example using `vim-plug`:

```lua
  {
    "mactunechy/rails-view-component-gd.nvim",
    ft = { 'slim', 'erb'},
    keys = {
      { "<leader>gd", "<cmd>lua require('rails-view-component-gd').open_class()<cr>" },
      { "<leader>gk", "<cmd>lua require('rails-view-component-gd').open_template()<cr>" },
    },
  }
```

## Usage
After installing the plugin, you can use it in any ERB or Slim file. The exact usage may depend on your Neovim configuration and keybindings.

## Contributing

Contributions are always welcome! Here's how you can help:

1. **Fork the repository**: Click the 'Fork' button at the top right of this page and clone your forked repository to your local machine.

2. **Create a new branch**: From your local repository, create a new branch for your feature or bugfix.

3. **Make your changes**: Make your changes to the code. Try to make sure your code follows any existing style guidelines.

4. **Test your changes**: Ensure that your changes do not break any existing functionality.

5. **Create a Pull Request**: Once you're satisfied with your changes, push your branch to your forked repository on GitHub. Then, open a Pull Request from your forked repository to the original repository.



## License

This project is licensed under the terms of the LICENSE file in the root directory of the project.