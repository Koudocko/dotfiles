return {
  'lukas-reineke/indent-blankline.nvim',

  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config

  opts = {
    scope = {
      enabled = true,
      show_start = true,
      show_exact_scope = true,
      highlight = { "Function", "Label" }
    }
  }
}
