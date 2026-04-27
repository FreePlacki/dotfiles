require("set")
require("remap")

function loadPlugins()
    local config = vim.fn.stdpath("config")
    local plugins = "plugins"
    local dir = vim.fs.dir(config .. "/lua/" .. plugins)
    for name, _ in dir do
        local filename = string.sub(name, 1, -5) -- remove '.lua'
    	require(plugins .. "." .. filename)
    end
end
loadPlugins()

