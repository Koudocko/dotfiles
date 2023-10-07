local status_ok1, builtin = pcall(require, "telescope.builtin")
if not status_ok1 then
  return
end

local status_ok2, actions = pcall(require, "telescope.actions")
if not status_ok2 then
  return
end

local status_ok3, telescope = pcall(require, "telescope")
if not status_ok3 then
  return
end

vim.keymap.set('n', '<C-f>', builtin.find_files, {})

telescope.setup({
  pickers = {
    find_files = {
      mappings = {
        i = {
          ["<C-j>"] = {
            actions.move_selection_next, type = "action",
            opts = { nowait = true, silent = true }
          },
          ["<C-k>"] = {
            actions.move_selection_previous, type = "action",
            opts = { nowait = true, silent = true }
          }
        }
      }
    }
  }
})
