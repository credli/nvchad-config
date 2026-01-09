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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
