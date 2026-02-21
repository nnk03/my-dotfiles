return {
   {
      'nvim-telescope/telescope.nvim', version = '*',
      dependencies = {
         'nvim-lua/plenary.nvim',
         { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
         local telescope = require("telescope")
         local actions = require("telescope.actions")
         telescope.setup({
            defaults = {
               path_display = { "truncate " },
               mappings = {
                  i = {
                     ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                     ["<C-j>"] = actions.move_selection_next, -- move to next result
                     ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                  },
               },
            },
         })

         telescope.load_extension("fzf")

         local builtin = require("telescope.builtin")

         local keymap = vim.keymap

         keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
         keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
         keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Fuzzy string in cwd" })
         keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
         keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find existing buffers" })
         keymap.set("n", "<leader>fw", builtin.current_buffer_fuzzy_find, { desc = "Find word in the current buffer ?" })
      end,
   },
   {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
         -- This is your opts table
         require("telescope").setup({
            extensions = {
               ["ui-select"] = {
                  require("telescope.themes").get_dropdown({
                     -- even more opts
                  }),

                  -- pseudo code / specification for writing custom displays, like the one
                  -- for "codeactions"
                  -- specific_opts = {
                     --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                           --     make_displayer = function(widths) -> displayer
                              --     make_display = function(displayer) -> function(e)
                                 --     make_ordinal = function(e) -> string
                                    --   },
                                    --   -- for example to disable the custom builtin "codeactions" display
                                    --      do the following
                                    --   codeactions = false,
                                    -- }
                                 },
                              },
                           })
                           -- To get ui-select loaded and working with telescope, you need to call
                           -- load_extension, somewhere after setup function:
                           require("telescope").load_extension("ui-select")
                        end,
                     }
                  }
