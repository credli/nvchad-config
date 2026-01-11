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


local function close_all_buffers_but_current_one()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, i in ipairs(bufs) do
    local buftype = vim.api.nvim_get_option_value('buftype', { buf = i })
    local is_listed = vim.api.nvim_get_option_value('buflisted', { buf = i })
    -- Only delete if it's NOT the current one AND it's a normal file
    -- (buftype is empty for normal files)
    if i ~= current_buf and buftype == "" and is_listed then
      vim.api.nvim_buf_delete(i, {})
    end
  end
end
map('n', '<C-Q>', close_all_buffers_but_current_one, { desc = "Close all buffers but the current one"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
