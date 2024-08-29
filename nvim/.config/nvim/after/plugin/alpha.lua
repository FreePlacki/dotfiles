local alpha = require("alpha")

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
    [[                            ..            ]],
    [[                          .:+:-.          ]],
    [[                        ..::*=:..         ]],
    [[                     ....::####:...       ]],
    [[                  ...-=::--*##=-::::=.    ]],
    [[                ....::##############=.    ]],
    [[          ........::#@#############@:.    ]],
    [[        ..:%::=::::-#################%    ]],
    [[      ....::*#####=##################+    ]],
    [[  ......:==%#########################.    ]],
    [[:::#:===+##########################-:.    ]],
    [[   .....:--%#########################:    ]],
    [[       ...::*#####-##################+    ]],
    [[         .:=::-::::=#################@    ]],
    [[          .........:#+#############+:.    ]],
    [[                ....::############%@+.    ]],
    [[                   ..:-:::-###=:::..:.    ]],
    [[                     ....::###%:...       ]],
    [[                        ...:-=:..         ]],
    [[                          .:%::.          ]],
}

dashboard.section.buttons.val = {
    dashboard.button("f", "󰱽  Find file", ":Telescope frecency workspace=CWD<CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    -- dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    -- dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    -- dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
}

local function footer()
    -- Number of plugins
    local total_plugins = #vim.fn.globpath("~/.local/share/nvim/lazy", "*", 0, 1)
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    local plugins_text = "    "
        .. total_plugins
        .. " plugins"
        .. "   "
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "  󰃰 "
        .. datetime

    -- Quote
    local fortune = require "alpha.fortune"
    local quote = table.concat(fortune(), "\n")

    -- local tip = os.shuf "-n 1 ~/nvim_keymaps.txt"
    return plugins_text .. "\n" .. quote
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
