require("config.remap")
require("config.set")
require("config.lazy")

vim.g.vimtex_view_method = 'zathura'

vim.g.suda_smart_edit = 1
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = '^\\.\\.\\($\\|/\\)\\|^\\.\\/$'

vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end

    bind('l', '<cr>')
    bind('h', '-')
    bind('r', 'R')
    bind('x', 'D')
    bind('n', '%')
  end
})
