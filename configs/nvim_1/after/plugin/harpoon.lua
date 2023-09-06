local status_ok0, mark = pcall(require, "harpoon.mark")
if not status_ok0 then
  return
end

local status_ok1, ui = pcall(require, "harpoon.ui")
if not status_ok1 then
  return
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-n>", function() ui.nav_next() end)
vim.keymap.set("n", "<C-p>", function() ui.nav_prev() end)
vim.keymap.set("n", "<C-y>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-b>", function() ui.nav_file(3) end)
