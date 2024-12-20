-- Neotest key mappings
vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run tests in file" })
vim.keymap.set("n", "<leader>ta", function() require("neotest").run.run({ suite = true }) end, { desc = "Run all tests" })
vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Open test output" })
vim.keymap.set("n", "<leader>tw", function() require("neotest").output_panel.toggle() end, { desc = "Toggle test output" })
vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })
vim.keymap.set("n", "<leader>ad", function() require("neotest").run.attach() end, { desc = "Attach to debugger" })
vim.keymap.set("n", "<leader>tk", function() require("neotest").run.stop() end, { desc = "Kill test" })
vim.keymap.set('n', '<leader>td', function()
  local file_path = vim.fn.expand('%:p') -- Full file path
  local line_number = vim.fn.line('.') -- Current line number
  local command = string.format(
    "split | terminal pkill -f rspec || pkill -f pry || cd $(git rev-parse --show-toplevel || echo '.') && bundle exec rspec %s:%s",
    file_path,
    line_number
  )
  vim.cmd(command)
end, { noremap = true, silent = true, desc = "Run nearest test in terminal split" })
