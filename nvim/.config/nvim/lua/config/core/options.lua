-- Core settings
vim.cmd("let g:netrw_liststyle = 3")
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.g.editorconfig = true

-- UI
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = ""
vim.opt.cursorline = false
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Search
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Windows
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.whichwrap = "bs<>[]hl"

-- Performance
vim.opt.updatetime = 50

-- Input
vim.opt.mouse = ""
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.clipboard = "unnamedplus"

-- Folding
vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldcolumn = "0"

-- Completion
vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 10

-- File path
vim.opt.isfname:append("@-@")

-- Format
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
