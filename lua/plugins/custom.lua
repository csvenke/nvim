return {
  -- Themes
  -- { "projekt0n/github-nvim-theme" },
  -- { "shaunsingh/nord.nvim" },
  { "AlexvZyl/nordic.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    opts = {
      show_help_hints = false,
      keymaps = {
        view = {
          { "n", "<leader>gd", "<cmd>DiffviewClose<cr>", remap = true },
        },
        diff2 = {
          { "n", "<leader>gd", "<cmd>DiffviewClose<cr>", remap = true },
        },
        file_panel = {
          { "n", "<leader>gd", "<cmd>DiffviewClose<cr>", remap = true },
        },
      },
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "diff" },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { { "prettierd", "prettier" } },
        ["javascriptreact"] = { { "prettierd", "prettier" } },
        ["typescript"] = { { "prettierd", "prettier" } },
        ["typescriptreact"] = { { "prettierd", "prettier" } },
        ["vue"] = { { "prettierd", "prettier" } },
        ["css"] = { { "prettierd", "prettier" } },
        ["scss"] = { { "prettierd", "prettier" } },
        ["less"] = { { "prettierd", "prettier" } },
        ["html"] = { { "prettierd", "prettier" } },
        ["json"] = { { "prettierd", "prettier" } },
        ["jsonc"] = { { "prettierd", "prettier" } },
        ["yaml"] = { { "prettierd", "prettier" } },
        ["markdown"] = { { "prettierd", "prettier" } },
        ["markdown.mdx"] = { { "prettierd", "prettier" } },
        ["graphql"] = { { "prettierd", "prettier" } },
      },
    },
  },

  -- ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    enabled = function()
      return vim.fn.getenv("OPENAI_API_KEY") ~= nil
    end,
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>cc", "<cmd>ChatGPT<cr>", desc = "AI Prompt" },
      { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<cr>", desc = "AI Edit", mode = { "n", "v" } },
    },
  },
}
