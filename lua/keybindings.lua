-- Disable arrow keys in all modes
for _, mode in pairs { "n", "i", "v", "c" } do
  for _, key in pairs {
    "<Up>",
    "<Down>",
    "<Left>",
    "<Right>",
  } do
    vim.keymap.set(mode, key, "<nop>")
  end
end
