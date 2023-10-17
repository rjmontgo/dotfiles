local opts = { remap = false, silent = true }

local keymap = vim.keymap.set;

keymap("n", "<leader>g", function() require('neogit').open() end, opts)
