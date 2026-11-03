vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.opt.showmatch = true

vim.filetype.add({
   extension = {
      svx = "markdown",
   },
})

vim.api.nvim_create_autocmd("LspAttach", {
   callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      local bufnr = args.buf

      if client and client:supports_method("textDocument/inlayHint") then
         vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=bufnr})
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr })
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr })
   end,
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = "svelte",
   callback = function()
      vim.bo.indentexpr = ""
   end,
})
vim.api.nvim_create_autocmd("FileType", {
   pattern = "http",
   callback = function(args)
      vim.treesitter.start(args.buf)
      vim.keymap.set("n", "<CR>", "<cmd>NvimHttpYac<CR>", {
         buffer = args.buf,
         desc = "Run HTTP request",
      })
   end,
})


--https://lazy.folke.io/installation より
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   {
      dir = vim.fn.stdpath("config") .. "/local-plugins/gorilla-night.nvim",
      name = "gorilla-night.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         vim.cmd.colorscheme("gorilla-night")
      end,
   },
   {
      "nvim-lualine/lualine.nvim",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
         "gorilla-night.nvim",
      },
      opts = function()
         return require("gorilla-night.lualine")
      end,
   },
   {
      "sphamba/smear-cursor.nvim",
      opts = {},
   },
   {
      "karb94/neoscroll.nvim",
      opts = {
         easing_function = "quadratic",
      },
   },
   {
      "mason-org/mason.nvim",
      opts = {
         registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
         },
      },
   },

   {
      "nvim-tree/nvim-tree.lua",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      keys = {
         {
            "<leader>e",
            "<cmd>NvimTreeToggle<CR>",
            desc = "Toggle file tree",
         },
      },
      opts = {
         update_focused_file = {
            enable = true,
            update_root = false,
         },
         view = {
            width = 30,
         },
         renderer = {
            group_empty = true,
         },
         filters = {
            dotfiles = false,
         },
         git = {
            enable = false,
         },
         diagnostics = {
            enable = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
         },
      },
   },

   {
      "neovim/nvim-lspconfig",
      config = function()
         -- グローバル変数vimを登録
         vim.lsp.config("lua_ls", {
            settings = {
               Lua = {
                  diagnostics = {
                     globals = { "vim" },
                  },
               },
            },
         })

         vim.lsp.enable({
            "html",
            "cssls",
            "ts_ls",
            "jsonls",
            "eslint",
            "tailwindcss",
            "svelte",
            "lua_ls",
            "rust_analyzer",
            "glsl_analyzer",
            "wgsl_analyzer",
            "docker_language_server",
            "marksman",
            "roslyn_ls"
         })
      end
   },
   {
      "evanleck/vim-svelte",
      ft = "svelte",
   },
   {
      "saghen/blink.cmp",
      version = "1.*",
      opts = {
         fuzzy = { implementation = "lua" },
         keymap = {
            preset = "none",
            ["<Tab>"] = {"select_next", "fallback"},
            ["<S-Tab>"] = {"select_prev", "fallback"},
            ["<CR>"] = { "accept", "fallback" },
            ["<Up>"] = {"fallback"},
            ["<Down>"] = {"fallback"},
            ["<C-n>"] = {"fallback"},
            ["<C-p>"] = {"fallback"}
         },
         sources = {
            default = { "lsp", "path", "buffer" },
         },
      },
   },
   {
      "lukas-reineke/indent-blankline.nvim",
         main = "ibl",
         opts = {
         indent = {
            char = "▏",
         },
      },
   },
{
      "OXY2DEV/markview.nvim",
      lazy = false,
   },
   {
      "kristijanhusak/vim-dadbod-ui",
      dependencies = {
         "tpope/vim-dadbod",
      },
      cmd = {
         "DBUI",
         "DBUIToggle",
         "DBUIAddConnection",
      },
   },
{
      "abidibo/nvim-httpyac",
      config = function()
         require("nvim-httpyac").setup({
            output_view = "vertical",
         })

         vim.keymap.set("n", "<leader>rr", "<cmd>NvimHttpYac<CR>", {
            desc = "Run HTTP request",
         })

         vim.keymap.set("n", "<leader>ra", "<cmd>NvimHttpYacAll<CR>", {
            desc = "Run all HTTP requests",
         })

         vim.keymap.set("n", "<leader>rp", "<cmd>NvimHttpYacPicker<CR>", {
            desc = "Pick HTTP request",
         })

         vim.keymap.set("n", "<leader>re", "<cmd>NvimHttpYacEnv<CR>", {
            desc = "Select HTTP environment",
         })
      end,
   },
}, {
   performance = {
      rtp = {
         reset = false,
      },
   },
})
