require("which-key").setup({
    preset = "modern",
    spec = {
        -- Telescope search function
        { "<leader>s", group = " Search" },
        { "<leader>l", group = " List" },
        { "<leader>g", group = " Go to" },
    },
})
