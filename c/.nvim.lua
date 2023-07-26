-- Simple .nvim.lua
local delay_ms = 3000

vim.defer_fn(function()
	local toggleterm = require("toggleterm")

	vim.keymap.set("n", ",u;", function()
	end, { silent = true, desc = "" })

	vim.keymap.set("n", ",uu", function()
	toggleterm.exec([[podman run -it --rm -v ${pwd}:/test derekthecool/ubuntu_build_image bash -c "cd /test && make"]])
	end, { silent = true, desc = "podman run -it" })

	vim.cmd("cd ./phone-number")

	vim.notify("Ready to run", vim.log.levels.INFO, { title = "Stimpack Notification" })
end, delay_ms)
