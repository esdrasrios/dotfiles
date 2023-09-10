vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"
    use({ 'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end })
    use 'folke/neodev.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'azabiong/vim-highlighter'
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-cheat.sh'
    use 'b3nj5m1n/kommentary'
    use 'rcarriga/nvim-notify'
    use 'airblade/vim-rooter'
    use 'maxmx03/fluoromachine.nvim'
    use 'embark-theme/vim'
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use "lukas-reineke/indent-blankline.nvim"
    use('ThePrimeagen/harpoon')
    use("theprimeagen/refactoring.nvim")
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "ray-x/lsp_signature.nvim",
    }
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
            }
        end
    }
    use {
        'folke/noice.nvim',
        requires = {
            'MunifTanjim/nui.nvim'
        }
    }
    use 'folke/zen-mode.nvim'
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-telescope/telescope-project.nvim" },
            { "nvim-telescope/telescope-live-grep-args.nvim" },
            { 'nvim-telescope/telescope-fzf-native.nvim',    run = 'make' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { "debugloop/telescope-undo.nvim" },
            { 'prochri/telescope-all-recent.nvim' },
            { "kkharji/sqlite.lua" }
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
            require("telescope").load_extension("undo")
            require("telescope").load_extension("fzf")
        end
    }
    use 'joechrisellis/lsp-format-modifications.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'lewis6991/gitsigns.nvim'
    use("mbbill/undotree")
    use 'nvim-tree/nvim-tree.lua'
    use 'github/copilot.vim'
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
end)
