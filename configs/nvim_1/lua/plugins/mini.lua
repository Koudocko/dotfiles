return {
    'echasnovski/mini.move',

    opts = {},

    config = function(_, opts)
        require('mini.move').setup(
            {
                mappings = {
                    left = '<S-h>',
                    right = '<S-l>',
                    down = '<S-j>',
                    up = '<S-k>',
                },

                options = {
                    reindent_linewise = true,
                },
            }

        )
    end

}
