local api = require("nvim-tree.api")
local name = "Nvim-tree"

local function on_attach(bufnr)
    -- Automatically open files upon creation
    -- (https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#automatically-open-file-upon-creation)
    -- api.events.subscribe(api.events.Event.FileCreated, function(file)
    -- 	vim.cmd("edit " .. file.fname)
    -- end)

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)
end

-- Custom mappings
-- vim.keymap.set("n", "<leader>e", function()
-- 	api.tree.focus()
-- end, { desc = "Nvim-tree: Open [F]ile explorer" })

Map("<leader>e", name, "Open [F]ile explorer", function()
    api.tree.focus()
end)

Map("<C-s>", name, "[S]ave", ":w<CR>")

require("nvim-tree").setup({
    on_attach = on_attach,
    hijack_cursor = true,
    sort = { sorter = "name" },
    view = {
        width = {
            min = 30,
            max = 50,
            padding = 1,
        },
    },
    renderer = {
        add_trailing = true,
        hidden_display = "all",
        highlight_opened_files = "name",
        indent_markers = { enable = true },
        icons = {
            diagnostics_placement = "signcolumn",
            git_placement = "before",
            modified_placement = "right_align",
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
    },
    modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
    },
    actions = {
        change_dir = { restrict_above_cwd = true },
        -- open_file = { quit_on_open = true, }
    },
    help = { sort_by = "desc" },
})