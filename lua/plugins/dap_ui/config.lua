require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    print("init")
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    print("Session terminated")
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.disconnect["dapui_config"] = function()
    dapui.close()
end
