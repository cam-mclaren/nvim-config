-- Camerons NVIM Clipboard config

os = require('os')
is_wsl = os.execute("test -e /proc/sys/fs/binfmt_misc/WSLInterop")
if is_wsl == 0 then 
    vim.notify("We believe this is WSL.", vim.log.levels.INFO)
    vim.cmd([[
    let g:clipboard = {
        \ 'name': 'win32yank-wsl',
        \ 'copy': {
        \   '+': 'win32yank.exe -i --crlf',
        \   '*': 'win32yank.exe -i --crlf',
        \   },
        \ 'paste': {
        \   '+': 'win32yank.exe -o --lf',
        \   '*': 'win32yank.exe -o --lf',
        \   },
        \ 'cache_enabled': 0,
        \}
    ]])
    vim.notify("Setting clipboard to use win32yank", vim.log.levels.INFO)
elseif os.getenv("WAYLAND_DISPLAY") =='wayland-0' then
    vim.notify("We believe this is Wayland", vim.log.levels.INFO)
    vim.cmd([[set clipboard+=unnamedplus]])
    vim.notify("Setting clipboard to use unnamedplus", vim.log.levels.INFO)
elseif os.getenv("DISPLAY") == ':0' then
    vim.notify("We believe this is X11", vim.log.levels.INFO)
    vim.cmd([[set clipboard+=unnamedplus]])
    vim.notify("Setting clipboard to use unnamedplus", vim.log.levels.INFO)
else
    vim.notify("Uknown display.\nUnable to configure clipboard", vim.log.levels.INFO)
end

