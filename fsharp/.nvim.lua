-- Simple .nvim.lua
local delay_ms = 3000

vim.defer_fn(function()
    local toggleterm = require("toggleterm")

    local build = 'dotnet build'
    vim.keymap.set("n", ",u;", function()
        toggleterm.exec(build)
    end, { silent = true, desc = build })

    local run = 'dotnet test'
    vim.keymap.set("n", ",uu", function()
        toggleterm.exec(run)
    end, { silent = true, desc = run })

    vim.cmd('cd ./log-levels')
    vim.cmd('e LogLevels.fs')

    vim.notify('Ready to run', vim.log.levels.INFO, { title = '.nvim.lua commands' })
end, delay_ms)
