local status_ok, indent = pcall(require, "ibl")
if not status_ok then
  return
end

vim.opt.list = true

indent.setup()
