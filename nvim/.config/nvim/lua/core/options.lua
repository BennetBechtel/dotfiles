-- Search settings
vim.o.hlsearch = false -- Disable highlight on search
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true -- Smart case search

-- Line numbers and display
vim.wo.number = true -- Enable line numbers
vim.o.relativenumber = true -- Set relative numbered lines
vim.o.numberwidth = 4 -- Set number column width
vim.o.cursorline = false -- Don't highlight current line
vim.o.showmode = false -- Don't show mode (e.g. -- INSERT --)
vim.o.showtabline = 2 -- Always show tabs
vim.o.signcolumn = "yes" -- Keep signcolumn on by default

-- Mouse and clipboard
vim.o.mouse = "" -- Disable mouse mode
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim

-- Indentation and formatting
vim.o.breakindent = true -- Enable break indent
vim.o.smartindent = true -- Smart indenting
vim.o.autoindent = true -- Copy indent from current line when starting new one
vim.o.shiftwidth = 4 -- Number of spaces for indentation
vim.o.tabstop = 4 -- Number of spaces for tab
vim.o.softtabstop = 4 -- Number of spaces tab counts for in editing
vim.o.expandtab = true -- Convert tabs to spaces

-- Window and buffer behavior
vim.o.splitbelow = true -- Horizontal splits go below
vim.o.splitright = true -- Vertical splits go right
vim.o.wrap = false -- Don't wrap lines
vim.o.linebreak = true -- Don't split words when wrapping
vim.o.scrolloff = 4 -- Minimal lines above/below cursor
vim.o.sidescrolloff = 8 -- Minimal columns on cursor sides
vim.o.whichwrap = "bs<>[]hl" -- Keys allowed to move to prev/next line

-- File handling
vim.o.undofile = true -- Save undo history
vim.o.backup = false -- No backup files
vim.o.writebackup = false -- No writebackup
vim.o.swapfile = false -- No swapfiles

-- Performance and updates
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Mapped sequence timeout

-- Completion and menus
vim.o.completeopt = "menuone,noselect" -- Better completion experience
vim.o.pumheight = 10 -- Pop-up menu height

-- Encoding and compatibility
vim.o.fileencoding = "utf-8" -- UTF-8 file encoding
vim.o.cmdheight = 1 -- Command line height
vim.o.conceallevel = 0 -- Show markdown symbols
vim.o.backspace = "indent,eol,start" -- Backspace behavior

-- Colors and UI
vim.opt.termguicolors = true -- Enable term GUI colors

-- Additional tweaks
vim.opt.shortmess:append("c") -- Avoid completion messages
vim.opt.iskeyword:append("-") -- Consider hyphens part of words
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Disable auto-comment
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Separate vim/neovim plugins
