return {
   "lervag/vimtex",
   lazy = false,
   init = function()
      -- vim.g.vimtex_indent_ignored_envs = { 'document' }

      -- disable opening of quickfix every time, file is compiled
      -- we can still open the quickfix window using <localleader>le
      vim.g.vimtex_quickfix_open_on_warning = 0

      -- Disable VimTeX's version check to bypass the v0.11 false positive
      vim.g.vimtex_version_check = 0

      -- PDF viewer setup for Wayland / Niri
      -- vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_method = "zathura_simple"
   end,
}
