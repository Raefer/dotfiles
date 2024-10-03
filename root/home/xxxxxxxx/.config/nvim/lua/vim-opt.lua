-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Nerd Font
vim.g.have_nerd_font = true

-- System
vim.opt.clipboard = "unnamedplus" -- clipboard
vim.opt.mouse = "a"               -- mouse support
vim.opt.undofile = true           -- undo history

-- Update Time
vim.opt.timeoutlen = 250
vim.opt.updatetime = 250

-- New Split Behavior
vim.opt.splitbelow = false
vim.opt.splitright = false

-- Indentation
vim.opt.autoindent = true -- auto indent the next line
vim.opt.expandtab = true  -- convert tabs to spaces
vim.opt.shiftwidth = 4    -- set the number of spaces for each step of indent
vim.opt.softtabstop = 4   -- set the amount of spaces to be affected with the <Tab> or <BS> character
vim.opt.tabstop = 4       -- set the width of the <Tab> character

-- Search Options
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Text Rendering
vim.opt.breakindent = true -- keep the wrapped line visually indented
vim.opt.linebreak = true   -- avoid wrapping a line in the middle of a word
vim.opt.scrolloff = 5      -- number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 5  -- number of columns to keep to the left and right of the cursor
vim.opt.wrap = true        -- allow line wrapping

-- UI
vim.opt.colorcolumn = ""
vim.opt.cursorline = false
vim.opt.inccommand = "split" -- incrementally show command effect
vim.opt.number = true
vim.opt.showmode = false     -- disable mode display, since the status line already displayed it
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true -- enable 24-bit color in the TUI
