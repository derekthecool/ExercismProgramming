-- Simple .nvim.lua
local delay_ms = 3000

vim.defer_fn(function()
	local toggleterm = require("toggleterm")

	-- vim.keymap.set("n", ",u;", function() end, { silent = true, desc = "" })

	vim.keymap.set("n", "`r1", function()
		toggleterm.exec(
			[[podman run -it --rm -v ${pwd}:/test derekthecool/ubuntu_build_image bash -c "cd /test && make"]]
		)
	end, { silent = true, desc = "podman run -it" })

	local directory = "leap"
	local directory_from_environment = os.getenv("c_project")
	if directory_from_environment then
		directory = directory_from_environment
	end

	V(string.format("Using C project directory: %s", directory))

	vim.cmd(string.format("cd ./%s", directory))

	vim.notify("Ready to run", vim.log.levels.INFO, { title = "Stimpack Notification" })
end, delay_ms)
