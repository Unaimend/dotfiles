-- Put this into plugi9n folder
-- https://youtu.be/n4Lp4cV8YR0?t=769
function open_repl()
  local file = vim.fn.expand("%:p")
  vim.cmd("vsplit | terminal")
  local command = ':call jobsend(b:terminal_job_id, "python3\\n")'
  vim.cmd(command)
  -- TODO Add current path to runtime path
  -- TODO Import file
  --https://stackoverflow.com/questions/11124578/automatically-import-modules-when-entering-the-python-or-ipython-interpreter
  -- use vim.fn.jobstart
  local command = ':call jobsend(b:terminal_job_id, "import ' .. file .. '\\n")'
  vim.cmd(command)
  print(file)

end

-- https://neovim.discourse.group/t/how-to-configure-floating-window-colors-highlighting-in-0-8/3193/4
vim.api.nvim_set_hl(0, "FloatBorder", {bg="#3B4252", fg="#5E81AC"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg="#3B4252"})

return {
  open_repl  = open_repl
}

