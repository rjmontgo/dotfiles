vim.o.background = "dark"

local colorscheme = "ayu-dark"

local status_ok_set_colorscheme, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok_set_colorscheme then
  vim.notify("colorscheme: " .. colorscheme .. " not found!")
  return
end


