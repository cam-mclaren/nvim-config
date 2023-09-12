function get_marked_filenames()
a=''
for k, i in pairs(require("nvim-tree.api").marks.list()) do 
  a=a..'"'..i['name']..'\\n"'.."."
end
a = a:sub(1,-2)
vim.cmd('let @" = '..a)
end

vim.cmd[[ command! GetFN lua get_marked_filenames() ]]

