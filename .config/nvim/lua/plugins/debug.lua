return {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
    config = function()
        local dap = require("dap")
        dap.adapters.python = function(cb, config)
            if config.request == "attach" then
                local port = (config.connect or config).port
                local host = (config.connect or config).host or "127.0.0.1"
                cb({
                    type = "server",
                    port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                    host = host,
                    options = {
                        source_filetype = "python",
                    },
                })
            else
                cb({
                    type = "executable",
                    command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python3",
                    args = { "-m", "debugpy.adapter" },
                    options = {
                        source_filetype = "python",
                    },
                })
            end
        end
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. "/venv/bin/python3") == 1 then
                        return cwd .. "/venv/bin/python3"
                    elseif vim.fn.executable(cwd .. "/.venv/bin/python3") == 1 then
                        return cwd .. "/.venv/bin/python3"
                    else
                        return "/usr/bin/python3"
                    end
                end,
            },
        }

        local dapui = require("dapui")
        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        vim.keymap.set("n", "<F3>", dap.disconnect, { silent = true })
        vim.keymap.set("n", "<F4>", dap.toggle_breakpoint, { silent = true })
        vim.keymap.set("n", "<F5>", dap.continue, { silent = true })
        vim.keymap.set("n", "<F6>", dap.run_to_cursor, { silent = true })
        vim.keymap.set("n", "<F7>", dap.step_into, { silent = true })
        vim.keymap.set("n", "<F8>", dap.step_over, { silent = true })
        vim.keymap.set("n", "<F9>", dap.step_out, { silent = true })
        vim.keymap.set("n", "<F10>", dapui.toggle, { silent = true })
    end,
}
