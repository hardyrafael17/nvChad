require("nvchad.mappings")
-- Disable mappings
--
local nomap = vim.keymap.del
nomap("n", "<C-n>")
nomap("n", "<leader>e")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jj", "<ESC>", { desc = "Escape insert mode" })
map("i", "kk", "<ESC>", { desc = "Escape insert mode" })
map("n", "<leader>e", ":NvimTreeToggle <cr>", { desc = "Toggle File Browser" })
map("n", "<S-h>", "<cmd>bp <cr>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>bn <cr>", { desc = "Next Buffer" })
map("n", "<leader>w", ":w<cr>", { desc = "Save changes" })



-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- multiple modes 
-- map({ "i", "n" }, "<C-k>", "<Up>", { desc = "Move down" })

-- map("n",  "<leader>ff", ":Telescope <cr>")

-- mapping with a lua functionAiII
-- map("n", "<A-i>", function()
--   require("nvchad.term").toggle({ pos = "sp", id ='abc' })
-- end, { desc = "Terminal toggle floating" })



