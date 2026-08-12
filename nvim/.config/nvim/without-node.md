# Node.js / npm / nvm Requirements in Your Neovim Config

## 🔴 Requires Node — won't work without it

| Plugin / Feature | Why Node is needed |
|---|---|
| **`ts_ls`** (TypeScript Language Server, via Mason) | `typescript-language-server` is an npm package — installed by Mason via `npm` |
| **`bashls`** (bash-language-server, via Mason) | `bash-language-server` is an npm package — installed by Mason via `npm` |
| **`nvim-treesitter`** | Comment in `treesitter.lua` notes: *"install tree-sitter-cli via npm or cargo"*. The `build = ":TSUpdate"` step compiles parsers; `tree-sitter-cli` is needed for any parser that can't use a prebuilt binary |

> **Note:** `prettier` and `eslint_d` (also Node-based) are commented out in `none-ls.lua`, so they don't apply right now.

---

## ✅ Works Seamlessly Without Node

Everything else in your config is fully independent of Node:

| Plugin / Feature | Runtime dependency |
|---|---|
| **`lua_ls`** (Lua LSP) | Binary from Mason (no Node) |
| **`rust_analyzer`** | Binary from Mason / cargo |
| **`clangd`** | System binary (LLVM/clang) |
| **`haskell-tools.nvim`** + HLS | GHCup-managed binary |
| **`none-ls`** (stylua, black, isort) | Rust binary / pip |
| **`nvim-cmp`** + LuaSnip + all sources | Pure Lua |
| **`telescope.nvim`** + fzf-native | C (compiled with `make`) |
| **`nvim-treesitter`** parsers | Most use prebuilt binaries; `tree-sitter-cli` is only needed if compiling from source |
| **`neo-tree`**, **`oil.nvim`** | Pure Lua |
| **`gitsigns`**, **`vim-fugitive`** | Requires `git`, not Node |
| **`lualine`**, **`alpha-nvim`**, **`cokeline`** | Pure Lua |
| **`harpoon`**, **`auto-session`**, **`snacks`** | Pure Lua |
| **`vimtex`** | Requires LaTeX toolchain, not Node |
| **`render-markdown`**, **`nvim-surround`**, **`nvim-autopairs`** | Pure Lua |
| **`sidekick.nvim`** | Pure Lua (runs whatever AI CLI you configure, e.g. `opencode`) |
| **`which-key`**, **`colorizer`**, **`treesitter-context`**, etc. | Pure Lua |
| **`vim-be-good`**, **`vim-maximizer`**, **`vim-tmux-navigator`** | Pure Vimscript/Lua |
| **`nvim-treesitter`** parser compilation | Can use `cargo` instead of npm for `tree-sitter-cli` |

---

## 📋 Summary

On a no-Node machine, you lose:

1. **TypeScript/JavaScript LSP** (`ts_ls`) — no intellisense for JS/TS
2. **Bash LSP** (`bashls`) — no intellisense for shell scripts
3. **`tree-sitter-cli` via npm** — but you can install it via `cargo` instead, or rely on prebuilt parser binaries (which Treesitter downloads by default)

Everything else — Rust, C/C++, Lua, Haskell, Python LSPs, all your UI plugins, git integrations, fuzzy finding, completions, snippets, LaTeX — works completely fine without Node.
