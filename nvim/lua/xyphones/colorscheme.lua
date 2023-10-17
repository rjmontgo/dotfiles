vim.o.background = "dark"

local colorscheme = "nightfox"

local status_ok, _ = pcall(require, colorscheme)
if not status_ok then
  vim.notify("Could not require: " .. colorscheme)
  colorscheme = "default"
end

local status_ok_set_colorscheme, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok_set_colorscheme then
  vim.notify("colorscheme: " .. colorscheme .. " not found!")
  return
end
