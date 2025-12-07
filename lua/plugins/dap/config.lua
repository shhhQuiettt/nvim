vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
    require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
    require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
    require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
    require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

vim.keymap.set("n", "<Leader>dl", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

vim.keymap.set("n", "<Leader>dr", function()
    require("dap").repl.open()
end)

vim.keymap.set("n", "<Leader>dt", function()
    require("dap").terminate()
end)
-- vim.keymap.set("n", "<Leader>dl", function()
--     require("dap").run_last()
-- end)
-- vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
--     require("dap.ui.widgets").hover()
-- end)
-- vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
--     require("dap.ui.widgets").preview()
-- end)
-- vim.keymap.set("n", "<Leader>df", function()
--     local widgets = require("dap.ui.widgets")
--     widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set("n", "<Leader>ds", function()
--     local widgets = require("dap.ui.widgets")
--     widgets.centered_float(widgets.scopes)
-- end)
--
--
--
--
vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
local dap = require("dap")
dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = "/usr/share/cpptools-debug/bin/OpenDebugAD7",
}

dap.configurations.c = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            -- If makefile is present  and make run exists use make run
            if vim.fn.filereadable("Makefile") == 1 and vim.fn.system("grep -q 'run' Makefile") == 0 then
                return "make run"
            end

            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        setupCommands = {
            {
                text = "-enable-pretty-printing", -- Pretty-printing for GDB
                description = "enable pretty printing",
                ignoreFailures = false,
            },
        },
    },
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            -- If makefile is present  and make run exists use make run
            if vim.fn.filereadable("Makefile") == 1 and vim.fn.system("grep -q 'run' Makefile") == 0 then
                return "make run"
            end

            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        setupCommands = {
            {
                text = "-enable-pretty-printing", -- Pretty-printing for GDB
                description = "enable pretty printing",
                ignoreFailures = false,
            },
        },
    },
}

-- if .venv exists then .venv/bin/python

require("dap-python").setup()
