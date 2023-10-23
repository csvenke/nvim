return {
  -- Themes
  { "AlexvZyl/nordic.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = false,
      },
    },
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    opts = {
      show_help_hints = false,
      keymaps = {
        view = {
          { "n", "<leader>gd", "<cmd>DiffviewClose<cr>" },
        },
        diff2 = {
          { "n", "<leader>gd", "<cmd>DiffviewClose<cr>" },
        },
        file_panel = {
          { "n", "<leader>gd", "<cmd>DiffviewClose<cr>" },
        },
      },
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "diff" },
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
