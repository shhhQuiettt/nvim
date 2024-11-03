-- -- global function
-- function Knit()
--     print("knit")
--     local filename = vim.fn.expand("%")
--     -- local command = "R -e 'rmarkdown::render(\"%\")'"
--     local command = "R -e 'rmarkdown::render(\"" .. filename .. "\")'"

--     vim.cmd(command)
-- end

-- vim.keymap.nnoremap({ "<leader>kn", Knit })

vim.g.R_pdfviewer = "firefox"
