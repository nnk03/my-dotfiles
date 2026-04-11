return {
  "folke/sidekick.nvim",
  opts = {
    -- Sidekick automatically detects many AI CLIs.
    -- You can define a custom prompt or tool if needed:
    tools = {
      opencode = {
        cmd = "opencode", -- The command you run in terminal
        -- Sidekick will handle the terminal lifecycle
      }
    }
  },
  keys = {
    { "<leader>aa", function() require("sidekick.cli").toggle() end, desc = "Toggle Sidekick CLI" },
    { "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, desc = "Send File to AI" },
    { "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, mode = "x", desc = "Send Selection" },
    { "<C-.>", function() require("sidekick.cli").focus() end, desc = "Focus Sidekick", mode = { "n", "t", "i" } },
  }
}
