return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.8',

  dependencies = { 'nvim-lua/plenary.nvim' },

  opts = {},

  config = function(_, opts)
    local telescope = require("telescope")

    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    vim.keymap.set('n', '<C-f>', builtin.find_files, {})


    telescope.setup({
      pickers = {
        find_files = {
          mappings = {
            i = {
              ["<C-j>"] = {
                actions.move_selection_next,
                type = "action",
                opts = { nowait = true, silent = true }
              },
              ["<C-k>"] = {
                actions.move_selection_previous,
                type = "action",
                opts = { nowait = true, silent = true }
              }
            }
          }
        }
      }
    })
  end
}
