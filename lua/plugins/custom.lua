return {
  -- Themes
  { "AlexvZyl/nordic.nvim", event = "VeryLazy" },
  {
    "LazyVim/LazyVim",
    event = "VeryLazy",
    opts = {
      colorscheme = "nordic",
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      diagnostics = {
        underline = false,
      },
    },
  },

  -- Editor
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      left = {
        {
          title = "File explorer",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          pinned = true,
          open = function()
            vim.api.nvim_input("<esc><space>e")
          end,
          size = { height = 0.5 },
        },
        "neo-tree",
      },
      animate = {
        enabled = false,
      },
    },
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
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
