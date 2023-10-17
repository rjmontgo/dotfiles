local opts = { remap = false, silent = true }

local keymap = vim.keymap.set;

vim.g.mapleader = " "

keymap("i", "kj", "<ESC>", opts)
--- Normal Mode ---
-- resize windows easily
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--- File Navigation
keymap("n", "<leader>e", vim.cmd.Ex)
keymap("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
keymap("n", "<leader>f", vim.lsp.buf.format)
keymap("n", "<leader>jk", ":vnew ~/.config/nvim<CR>")


local function zen_color()
  if not vim.g['zen_mode'] then
    vim.cmd("highlight Normal guibg=#000000")
    vim.g['zen_mode'] = true
  else
    vim.cmd("highlight Normal guibg=NONE")
    vim.g['zen_mode'] = false
  end
end

keymap("n", "<leader>z", zen_color)

