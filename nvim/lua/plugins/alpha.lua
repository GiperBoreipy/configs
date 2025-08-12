return  {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
        [[                                                   ]],
      [[                                              ___  ]],
      [[                                           ,o88888 ]],
      [[                                        ,o8888888' ]],
      [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
      [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
      [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
      [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
      [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
      [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
      [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
      [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
      [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
      [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
      [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
      [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
      [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
      [[     ...:.'.:.::::"'    . . . . .'                 ]],
      [[    .. . ....:."' `   .  . . ''                    ]],
      [[  . . . ...."'                                     ]],
      [[  .. . ."'                                         ]],
      [[ .                                                 ]],
      [[                                                   ]],
    }

    dashboard.section.buttons.val = {}

    local function get_git_info()
      local git_branch = "N/A"
      local git_project = "N/A"
      
      if vim.fn.executable("git") == 1 then
        -- Ветка
        local branch_handle = io.popen("git branch --show-current 2>nul")
        if branch_handle then
          git_branch = branch_handle:read("*a"):gsub("%s+", "") or "N/A"
          branch_handle:close()
        end
        
        -- Проект (имя папки)
        local project_handle = io.popen("git rev-parse --show-toplevel 2>nul")
        if project_handle then
          local project_path = project_handle:read("*a"):gsub("%s+", "")
          project_handle:close()
          if project_path ~= "" then
            git_project = vim.fn.fnamemodify(project_path, ":t")
          end
        end
      end
      
      return git_project, git_branch
    end

    local function get_plugins_info()
      if not pcall(require, "lazy") then
        return "N/A", "N/A"
      end
      
      local lazy = require("lazy")
      local total = 0
      local loaded = 0
      
      for _, plugin in pairs(lazy.plugins()) do
        total = total + 1
        if package.loaded[plugin.name] then
          loaded = loaded + 1
        end
      end
      
      return loaded, total
    end
    
    local startup_start = vim.loop.hrtime()

    -- Функция для получения точного времени старта
    local function get_startup_time()
      local startup_end = vim.loop.hrtime()
      return math.floor((startup_end - startup_start) / 1e6) -- преобразуем наносекунды в миллисекунды
    end

    -- Основная информация для отображения
    dashboard.section.footer.val = function()
      local git_project, git_branch = get_git_info()
      local loaded_plugins, total_plugins = get_plugins_info()
      local startup_time = get_startup_time() 
      
      return {
        "󰊢  Project: " .. git_project,
        "󰘬  Branch:  " .. git_branch,
        "󰍛  Startup: " .. startup_time .. "ms",
        "  Plugins: " .. loaded_plugins .. "/" .. total_plugins .. " loaded",
      }
    end

    alpha.setup(dashboard.config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        vim.cmd [[ autocmd BufUnload <buffer> silent! :bd ]]
      end,
    })
  end
}
