-- create a function that returns 0
--
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
        -- create a
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function(_, opts)
			-- add codeium as source in the first place
			local cmp = require("cmp")
			local config = require "nvchad.configs.cmp"
			table.insert(config.sources, {
				name = "codeium", priority = 1001, max_item_count = 3
			})
			table.insert(config.sources, {
				name = "copilot", priority = 1000, max_item_count = 3
			})
			cmp.setup(config)
		end,
		dependencies = {
			{
				"jcdickinson/codeium.nvim",
				config = function()
					require("codeium").setup({})
				end,
			},
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
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
