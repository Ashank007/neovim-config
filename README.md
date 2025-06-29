
[![Neovim Version](https://img.shields.io/badge/Neovim-0.9+-blue?logo=neovim)](https://neovim.io/)
[![Language](https://img.shields.io/badge/Language-Lua-yellow?logo=lua)](https://www.lua.org/)
[![Plugin Manager](https://img.shields.io/badge/Plugin%20Manager-Lazy.nvim-green?logo=lua)](https://github.com/folke/lazy.nvim)
[![Java Support](https://img.shields.io/badge/Java-LSP%20Support-orange?logo=openjdk)](https://github.com/mfussenegger/nvim-jdtls)

# 🌿 My Neovim Configuration

A modern, fast, and minimal **Neovim configuration** powered by **Lua** and **Lazy.nvim**, tailored for **Java development** with full `nvim-jdtls` support. Includes LSP, Treesitter, autocompletion, UI enhancements, testing tools, and productivity plugins — optimized for a smooth developer experience across languages.

---

## 📦 Features

- ⚙️ **LSP & Autocompletion**: Integrated with `nvim-lspconfig`, `cmp-nvim`, `TabNine`, and `nvim-jdtls`.
- 🌳 **Treesitter**: Syntax highlighting and advanced code navigation.
- 🚀 **Productivity**: Autosave, bufferline, smart splits, toggleterm, and which-key.
- 🌗 **UI Enhancements**: Dressed popups, LuaLine statusline, Noice notifications, and Nightfox theme.
- 🔍 **Telescope**: Fuzzy finding for files, buffers, LSP symbols, and more.
- 🧪 **Testing**: Built-in support for JUnit and TestNG via `nvim-jdtls`.
- 🐍 **Python Venvs**: Seamless environment switching with `venv-selector`.

## 📁 Directory Structure

```text
.
├── init.lua                    # Entry point
├── lua/
│   ├── keymaps.lua            # Keybindings
│   ├── plugin.lua             # Lazy.nvim setup
│   ├── plugins/               # Plugin configurations
│   └── nvim-jdtls/            # Java support
├── ftplugin/java.lua          # Java-specific tweaks
├── lazy-lock.json             # Plugin lock file
└── init.vim.bak               # Old Vim config
```
## 🛠️ Setup

```
git clone https://github.com/Ashank007/neovim-config.git ~/.config/nvim
nvim
```
Neovim will auto-install plugins using Lazy.nvim on first launch.

## 🧠 Recommended

- Neovim v0.9+

- JDK 17+ (for Java LSP)

- Python 3.x (for LSP & virtualenvs)

- ripgrep, fd (for Telescope)

## 📜 License

- Open-source and available under the MIT License.

