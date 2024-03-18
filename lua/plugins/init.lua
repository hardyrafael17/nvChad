return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- defaults
				"vim",
				"lua",
				"vimdoc",

				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",

				-- -- low level
				-- "c",
				-- "zig",
			},
		},
	},
	-- {
	--   "zbirenbaum/copilot.lua",
	--   cmd = "Copilot",
	--   event = "InsertEnter",
	--   config = function()
	--     require("copilot").setup({})
	--   end,
	-- },
	-- {
	--   "zbirenbaum/copilot-cmp",
	--   config = function ()
	--     require("copilot_cmp").setup()
	--   end
	-- },
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			print("requiring codeium")
			require("codeium").setup({})
		end,
		event = "BufEnter",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
		opts = {
			ensure_installed = {
				"lua-language-server",
				"html-lsp",
				"prettier",
				"stylua",
				"tsserver",
			},
		},
	},
}
