-- Editor Appearance Customisations
--
-- 
-- We have red skulls for unsaved work
-- We now have green cool emoticons for saved work
-- love hearts 63440 - 63444 
-- Unsaved changes indicator
vim.cmd([[ 
            function! MyTest()
                if &mod==0 
                    return  nr2char(2062) ..' ' .. nr2char(2062) ..' ' .. nr2char(2062)
                else
                    return  nr2char(64394) .. ' ' .. nr2char(64394) ..' ' .. nr2char(64394)
            endfunction

            function! MyColGroup()
                if &mod==0
                    return '%#CamsNoFileChange#'
                else
                    return  '%#CamsFileChange#' 
            endfunction

            highlight CamsFileChange guifg=red guibg=#00005f
            highlight CamsNoFileChange  guifg=green guibg=#00005f
            highlight CamsStatusLine guifg=white guibg=#00005f ]]) 
vim.api.nvim_command('set statusline=%#CamsStatusLine#\\|%f\\ \\|\\ %{%MyColGroup()%}%{MyTest()}%#CamsStatusLine#\\ \\|\\ %=\\|\\ %Y\\ \\|\\ encoding\\:\\ %{&fileencoding?&fileencoding:&encoding}\\ \\|')

vim.api.nvim_command('set number')
    --if os.getenv('TERM')=='screen' then
vim.api.nvim_command("hi LineNr guibg=#00005f")
vim.api.nvim_command('hi LineNr guifg=grey')
    --vim.api.nvim_command('hi StatusLine guifg=#00005f')
    --vim.api.nvim_command('hi StatusLine guibg=white')

