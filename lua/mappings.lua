require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Toggle Trouble for the current file
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
-- Toggle Trouble for the entire project (Workspace)
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Workspace Diagnostics (Trouble)" })
-- Jump to next/previous trouble item
map("n", "[q", function() require("trouble").next({skip_groups = true, jump = true}) end, { desc = "Next Trouble Item" })
map("n", "]q", function() require("trouble").prev({skip_groups = true, jump = true}) end, { desc = "Previous Trouble Item" })

-- cycle through open buffers
map('n', 'gt', ':bnext<CR>', { desc = "Next Buffer" })
map('n', 'gT', ':bprev<CR>', { desc = "Prev Buffer" })

-- Window Splitting
map('n', '<leader>v', ':vsplit<CR>', { desc = "Vertical Split" })
map('n', '<leader>h', ':split<CR>', { desc = "Horizontal Split" })

-- Buffer Closing
map('n', '<leader>q', ':bd<CR>', { desc = "Close Buffer" })

-- Window Navigation
map('n', '<C-h>', '<C-w>h', { desc = "Move Left" })
map('n', '<C-l>', '<C-w>l', { desc = "Move Right" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
