return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
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
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      -- add codeium as source in the first place
      local cmp = require "cmp"
      local config = require "nvchad.configs.cmp"
      table.insert(config.sources, {
        name = "codeium",
        priority = 1001,
        max_item_count = 3,
      })
      cmp.setup(config)
    end,
    dependencies = {
      {
        "jcdickinson/codeium.nvim",
        config = function()
          require("codeium").setup {}
        end,
      },
    },
  },
  {
    "Exafunction/codeium.vim",
    config = function() end,
    event = "bufEnter",
  },
  { "ggandor/leap.nvim" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        markdown = { "eslint_d" },
        typescript = { "eslint_d" },
        javascript = { "standardjs" },
        javascriptreact = { "standardjs" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
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

  {
    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup {
        auto_display = true,
      }
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  {
    lazy = false,
    "sindrets/diffview.nvim",
  },
  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- -- install with yarn or npm
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd app && yarn install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = { "markdown" },
  -- },
}
