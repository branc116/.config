--Basic settings
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Packer
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'folke/tokyonight.nvim'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use({ "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      -- Snippets
      {'L3MON4D3/LuaSnip'},
      -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'},
    }
  }
  use('preservim/nerdtree')
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }
  use"Vonr/align.nvim"
  use'sakhnik/nvim-gdb'
end)

--apply theme
vim.cmd[[colorscheme tokyonight]]

local telescopebuiltin = require('telescope.builtin')
vim.g.mapleader = " "
vim.keymap.set("n", "", vim.cmd.w)
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("n", "<C-J>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<C-K>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<C-L>", "<cmd>wincmd l<cr>")
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<C-q>", "<cmd>bd<cr><cmd>bnext<cr>")

vim.keymap.set('n', '<leader>ff', telescopebuiltin.find_files, {})
vim.keymap.set('n', '<C-p>', telescopebuiltin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
  telescopebuiltin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>b', telescopebuiltin.buffers, {})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>nt", vim.cmd.NERDTreeToggle)

vim.keymap.set("n", "<leader>cv", "<cmd>e ~/.config/nvim<cr>")
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<cr>")
vim.keymap.set("n", "<leader>td", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
vim.keymap.set("n", "<leader>li", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>")
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>")
vim.keymap.set("n", "<leader>lw", "<cmd>lua vim.lsp.buf.workspace_folders()<cr>")
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>")
vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<cr>")
vim.keymap.set("n", "<C-`>", "<cmd>lua vim.lsp.buf.code_action()<cr>")


vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>q", "<cmd>TroubleToggle quickfix<cr>",
{silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
{silent = true, noremap = true}
)

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.keymap.set("i", "", "<ESC>")

-- Window navigation
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
-- Window resize
vim.keymap.set("n", "<A-K>", "<C-w>+")
vim.keymap.set("n", "<A-J>", "<C-w>-")
vim.keymap.set("n", "<A-H>", "<C-w><")
vim.keymap.set("n", "<A-L>", "<C-w>>")

local NS = { noremap = true, silent = true }

vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)             end, NS) -- Aligns to 1 character, looking left
vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, NS) -- Aligns to 2 characters, looking left and with previews
vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews



-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "python", "cpp", "help", "javascript", "typescript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  }, 
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
}

-- Lsp setup
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.configure('pyright', {
    settings = {
      pythonPath = "/usr/bin/python3.11"
    }
})

lsp.setup()
