-- Camerons NVIM Clipboard config

os = require('os')
is_wsl = os.execute("test -e /proc/sys/fs/binfmt_mist/WSLInterop")
if is_wsl == 0 then 
    print("We believe this is WSL.")
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
    print("Setting clipboard to use win32yank")
elseif os.getenv("DISPLAY") == ':0' then
    print("We believe this is X11")
    vim.cmd([[set clipboard+=unnamedplus]])
    print("Setting clipboard to use unnamedplus")
elseif os.getenv("WAYLAND_DISPLAY") ==':0' then
    print("We believe this is Wayland")
    vim.cmd([[set clipboard+=unnamedplus]])
    print("Setting clipboard to use unnamedplus")
else
    print("Uknown display.\nUnable to configure clipboard")
end

