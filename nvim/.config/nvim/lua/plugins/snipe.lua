return {
    "leath-dub/snipe.nvim",
    keys = {
        {"<leader>fr", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
    },
    -- opts = {},
    config = function()
        require("snipe").setup({
            ui = {
                -- Where to place the ui window
                -- Can be any of "topleft", "bottomleft", "topright", "bottomright", "center", "cursor" (sets under the current cursor pos)
                ---@type "topleft"|"bottomleft"|"topright"|"bottomright"|"center"|"cursor"
                position = "center"
            },
            hints = {
                -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
                ---@type string
                dictionary = "asdfzxcv",
            },
            navigate = {
                -- In case you changed your mind, provide a keybind that lets you
                -- cancel the snipe and close the window.
                ---@type string|string[]
                cancel_snipe = "q",

                -- Close the buffer under the cursor
                -- Remove "j" and "k" from your dictionary to navigate easier to delete
                -- NOTE: Make sure you don't use the character below on your dictionary
                close_buffer = "D",
            },
            -- The default sort used for the buffers
            -- Can be any of:
            --  "last" - sort buffers by last accessed
            --  "default" - sort buffers by its number
            --  fun(bs:snipe.Buffer[]):snipe.Buffer[] - custom sort function, should accept a list of snipe.Buffer[] as an argument and return sorted list of snipe.Buffer[]
            ---@type "last"|"default"|fun(buffers:snipe.Buffer[]):snipe.Buffer[]
            sort = "default",
        })
    end
}
