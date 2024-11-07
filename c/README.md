# README

Setting up the proper C environment can be difficult. I've found it to be
impossible actually on windows to get the make stuff working correctly.

So, let's use podman to help us.

I've created a basic `./.nvim.lua` lua init script that will dynamically set key
mappings to run the project in podman using my custom built Ubuntu container.

## Project Selection

You can also choose which project to be running before entering neovim by
setting the environment variable `c_project` to the name of the directory of the
project e.g. `leap`.

```sh
# Powershell
$env:c_project = 'leap'

# Bash
export c_project = 'leap'
```
