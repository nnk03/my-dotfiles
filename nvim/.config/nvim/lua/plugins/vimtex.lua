return {
   "lervag/vimtex",
   lazy = false,
   init = function()
      -- Disable VimTeX's version check to bypass the v0.11 false positive
      vim.g.vimtex_version_check = 0

      -- PDF viewer setup for Wayland / Niri
      vim.g.vimtex_view_method = "zathura"
   end,
}
