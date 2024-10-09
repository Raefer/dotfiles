return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = false,
				theme = "auto",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
		},
	},

	{ -- plugin.Nvim-tree
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"numToStr/Comment.nvim",
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			preset = "modern",
			spec = {
				-- Telescope search function
				{ "<leader>s", group = " Search" },
				{ "<leader>l", group = " List" },
				{ "<leader>g", group = " Go to" },
			},
		},
	},

	{ -- plugin.Mason-lspconfig
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			{ "j-hui/fidget.nvim", opts = {} },
		},
	},

	{ -- plugin.Telescope
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	{ -- plugin.Nvim-cmp
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
	},

	{ -- plugin.Treesitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{ -- plugin.Conform
		"stevearc/conform.nvim",
	},

	{ -- plugin.Neorg
		"nvim-neorg/neorg",
		lazy = false,
		version = "*",
	},

	{ -- plugin.Todo-comments
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ -- plugin.Nvim-highlight-colors
		"brenoprata10/nvim-highlight-colors",
	},

	{ -- theme.Nightfox
		"EdenEast/nightfox.nvim",
		priority = 1000,
	},

	{ -- theme.Onedark
		"navarasu/onedark.nvim",
		priority = 1000,
	},
}
