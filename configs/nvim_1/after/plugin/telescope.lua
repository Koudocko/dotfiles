local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  return
end

vim.keymap.set('n', '<C-f>', builtin.find_files, {})
