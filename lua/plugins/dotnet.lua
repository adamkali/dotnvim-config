local function dotnet_bootstrap()
    local dotnet = require 'dotnvim'
    dotnet.bootstrap()
end

local function dotnet_build_last()
    local dotnet = require 'dotnvim'
    dotnet.build(true)
end

local function dotnet_watch_last()
    local dotnet = require('dotnvim')
    dotnet.watch(true)
end

local function dotnet_restart_watch()
    local dotnet = require('dotnvim')
    dotnet.restart_watch()
end

local function dotnet_shutdown_watch()
    local dotnet = require('dotnvim')
    dotnet.shutdown_watch()
end

return {
    {
        dir = 'adamkali/dotnvim',
        ft = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' },
        keys = {
            { '<leader>ds', dotnet_bootstrap,      desc = 'Bootstrap Class' },
            { '<leader>db', dotnet_build_last,     desc = 'Build Last Project' },
            { '<leader>dw', dotnet_watch_last,     desc = 'Watch Last Project' },
            { '<F10>',      dotnet_restart_watch,  desc = 'Restart Watch Job' },
            { '<F34>',      dotnet_shutdown_watch, desc = 'Shutdown Watch Job' }
        },
        opts = {
            builders = {
                -- will append -lp https always.
                --
                https_launch_setting_always = true,
            },
            ui = {
                no_pretty_uis = false
            },
            dap = {
                configurations = {}
            }
        }
    },
}
