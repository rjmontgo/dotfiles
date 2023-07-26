local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

vim.keymap.set("n", "<leader>a", function() harpoon_mark.add_file() end)
vim.keymap.set("n", "<C-e>", function() harpoon_ui.toggle_quick_menu() end)
vim.keymap.set("n", "]h", function() harpoon_ui.nav_next() end)
vim.keymap.set("n", "[h", function() harpoon_ui.nav_prev() end)

