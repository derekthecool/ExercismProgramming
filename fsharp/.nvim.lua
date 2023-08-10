-- Simple .nvim.lua
local delay_ms = 3000

vim.defer_fn(function()
    local toggleterm = require("toggleterm")

    vim.keymap.set("n", ",u;", function()
        toggleterm.exec("dotnet build")
    end, { silent = true, desc = "idf.py build" })

    vim.keymap.set("n", ",uu", function()
        toggleterm.exec("dotnet test")
    end, { silent = true, desc = "idf.py build flash monitor" })

    -- vim.cmd('cd ./lucians-luscious-lasagna/')
    vim.notify('Ready to run', vim.log.levels.INFO, { title = 'Stimpack Notification' })
end, delay_ms)
