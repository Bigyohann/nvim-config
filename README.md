# ✨ Biggy's Neovim 🚀

A optimized, LSP-rich Neovim configuration tailored for modern development (Go, Node.js/TypeScript, PHP).

## 🌟 Key Features

-   **Full LSP Support**: Out-of-the-box support for 50+ languages and tools.
-   **Native & Fast**: Plugin management via native `vim.pack` (no heavy plugin managers).
-   **Pro Tooling**: Integrated debugging (DAP), linting, and formatting.
-   **Full Stack Ready**: Specialized setups for Go, Node.js/TypeScript, and PHP (Intelephense).
-   **Portable**: Works seamlessly on macOS and Linux.

---

## 🛠️ Installation

This configuration is intended to be managed by [Biggy's Dotfiles Engine](https://github.com/Bigyohann/dot-config) via chezmoi, but can be installed manually:

```zsh
git clone git@github.com:Bigyohann/nvim-config.git ~/.config/nvim
```

## ⚙️ Requirements

-   **Neovim** >= 0.12.0
-   **Nerd Font** (JetBrainsMono recommended)
-   **ripgrep**, **fd**, **fzf**

---

## 🧩 LSP & Tooling Matrix

This config automatically manages the following via `mason.nvim`:

| Category | Tools |
| :--- | :--- |
| **Go** | `gopls`, `golangci-lint`, `go-debug-adapter` |
| **Node/JS/TS** | `typescript-language-server`, `vtsls`, `eslint`, `prettier`, `biome` |
| **Backend/Systems** | `python-lsp-server`, `clangd`, `sqlls` |
| **Frameworks** | `angular-language-server`, `vue-language-server`, `emmet-ls` |
| **DevOps** | `dockerfile-language-server`, `yaml-language-server`, `terraform-ls` |
| **Formatting** | `stylua`, `shfmt`, `shellcheck`, `markdownlint` |
| **PHP** | `intelephense`, `php-cs-fixer`, `phpcs`, `php-debug-adapter` |

---

## 📁 Repository Structure

-   `init.lua`: Main entry point.
-   `lua/`:
    -   `lsp.lua`: Comprehensive LSP and Mason configuration.
    -   `plugins/`: Configuration for various plugins.
-   `snippets/`: Custom language-specific snippets.
-   `lsp/`: Specialized LSP server settings.

---
Built with ❤️ by [Biggy](https://github.com/Bigyohann)
