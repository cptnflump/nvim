-- Bootstrap lazy.nvim
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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})



vim.opt.splitbelow = true     -- Split new windows at the bottom

vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 2        -- Number of spaces to use for each indentation level
vim.opt.tabstop = 2           -- Number of spaces a <Tab> counts for
vim.opt.softtabstop = 2       -- Number of spaces for <Tab> when editing
vim.opt.undofile = true

-- terminal shortcut
function OpenTerminalInBottomSplit()
  vim.cmd("split")
  vim.cmd("resize " .. math.floor(vim.o.lines * 0.25))  -- Adjusts height to 30% of total lines
  vim.cmd("terminal")
end

vim.api.nvim_set_keymap("n", "<leader>t", ":lua OpenTerminalInBottomSplit()<CR>", { noremap = true, silent = true })

-- line numbers
vim.opt.number = true

-- rubocop keybind
vim.api.nvim_set_keymap("n", "<leader>rr", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- Alpha startup keybind
vim.api.nvim_set_keymap("n", "<leader>aa", [[:lua if vim.bo.filetype ~= "alpha" then vim.cmd("rightbelow vsplit | Alpha | only") end<CR>]], { noremap = true, silent = true })

vim.keymap.set('n', '<leader>db', ':DBUI<CR>', { noremap = true, silent = true })

-- blocking d register for debugger line 
vim.api.nvim_set_keymap('n', 'q', [[:lua BlockOverwriteForD()<CR>]], { noremap = true, silent = true })

function BlockOverwriteForD()
    local register = vim.fn.getcharstr() -- Get the register being recorded to
    if register == 'd' then
        local current_macro = vim.fn.getreg('d') -- Check the content of register 'd'
        if current_macro ~= "" then
            print("Cannot overwrite macro in register 'd'.")
            return
        end
    end
    vim.cmd("normal! q" .. register) -- Proceed with recording if it's not 'd' or if 'd' is empty
end

-- setting fold config 
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- keymap for search and replace 
vim.api.nvim_set_keymap('n', '<leader>sr', ':%s//gc<Left><Left><Left>', { noremap = true, silent = false })
