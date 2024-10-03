-- Vim settings
require("vim-opt")
vim.cmd("so ~/.config/nvim/legacy.vim")

--- Add a new mapping
---@param keys string Keymap
---@param name string
---@param desc string Description of the mapping
---@param func string|function Action
---@param bufr integer|nil If the mapping requires the current buffer, pass in bufnr, else, pass in nil
---@param mode string|string[]|nil Mode in which the mapping funciton, leave blank for normal mode
function Map(keys, name, desc, func, bufr, mode)
    mode = mode or "n" -- if the value is empty, use the default
    bufr = bufr or nil
    local description = " " .. name .. ": " .. desc

    vim.keymap.set(mode, keys, func, (bufr and { buffer = bufr, desc = description } or { desc = description }))
end

-- Lazy
require("manager")

-- Theme
-- require("theme.catppuccin")
-- require("theme.everforest")
-- require("theme.gruvbox-material")
require("theme.nightfox")
-- require("theme.onedark")
