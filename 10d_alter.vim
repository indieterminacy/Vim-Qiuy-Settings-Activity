"= 10 Edit
"== 10 Editing
"=== 60 System
"==== 60 Language Tool
    let g:languagetool_jar='$HOME/.languagetool/LanguageTool-2.6/languagetool-commandline.jar'
"= 10 Insert
"== 60 Insertion Tools
"=== 60 Neocomplete settings
    " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
    " Use neocomplete.
    " Uncommenting as no longer using NeoComplete
            " let g:neocomplete#enable_at_startup = 1
        " Use smartcase.
            " let g:neocomplete#enable_smart_case = 1
        " Set minimum syntax keyword length.
            " let g:neocomplete#sources#syntax#min_keyword_length = 3
            " let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

        "let g:neocomplete#enable_cursor_hold_i = 1
        " Or set this.
        "let g:neocomplete#enable_insert_char_pre = 1

        "AutoComplPop like behavior.
        "let g:neocomplete#enable_auto_select = 1

        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplete#enable_auto_select = 1
        "let g:neocomplete#disable_auto_complete = 1
"=== 60 Omni Completion
    " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType c set omnifunc=ccomplete#Complete
        autocmd FileType java set omnifunc=javacomplete#Complete

    " use syntax complete if nothing else available
        if has("autocmd") && exists("+omnifunc")
          autocmd Filetype *
            \ if &omnifunc == "" |
            \ setlocal omnifunc=syntaxcomplete#Complete |
            \ endif
        endif
"=== 60 NeoComplete
    " Enable heavy omni completion.
    " Uncommented as no longer using NeoComplete
        " if !exists('g:neocomplete#sources#omni#input_patterns')
        "     let g:neocomplete#sources#omni#input_patterns = {}
        "     let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        "     let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        "     let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        " endif
"=== 60 OmniComplete
    " For perlomni.vim setting.
    " Uncommented as not sure if installed
    " https://github.com/c9s/perlomni.vim
        " let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"== 60 Snippets Tools
"=== 60 Ultisnips
    " Providing directory path for looking for snippets
        " let g:UltiSnipsSnippetDirectories=[$HOME.'/.ind-vim/20_Content/20_UltiSnips']
    "Ultisnips mapping defaults
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsListSnippets="<C-tab>"
        let g:UltiSnipsJumpForwardTrigger="<C-J>"
        let g:UltiSnipsJumpBackwardTrigger="<C-K>"
"== 20 Insert Snippets
"=== 60 Configuration Snippets
"= 10 Undo
"== 60 System
"=== 10 Persistent Undo
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Turn persistent undo on
    " means that you can undo even when you close a buffer/VIM
    " Keep undo history across sessions, by storing in file. Only works all the time.
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        try
          set undodir=~/.vim/backups
          set undofile
          catch
        endtry
        " endtry"
"= 20 Delete
"== 10 Delete Objects
"=== 10 Delete Whitespace
    " Remove any introduced trailing whitespace after moving...
        let g:DVB_TrimWS = 1
"= 20 Paste
"== 60 System
"=== 10 Clipboard
    " normal OS clipboard interaction
        set clipboard=unnamed
"=== 60 Contexts
    " silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
"==== 10 Paste Scripts
    " Add Plugin information around url if in right folder and url is
    " bundle
    " To Put ELSEWHERE AS INDIVIDUAL SCRIPT
        function! MyFunc()
            " if BufFile = **/60_Plugins/**
            " let m = getcwd()
            " echo m
"===== 50 Environment
    " for ascertaining whether working on plugins
        let plugins_folder     = '50_Environment/60_Plugins'
        " let plugins_production = 'production'
        let buffer_folder      = expand('%:p')
"===== 20 Content
    " for ascertaining whether paste relates to a vim
    " plugin address
        let github_address     = 'github.com'
        let vimscripts_address = 'vim.org'
        let paste_buffer       = getreg('+')
"===== 50 Environment
"====== 50 Testing
    " For testing the folder concerns plugins
        " buffer_folder =~ plugins_folder ? echo true : echo false
        if buffer_folder =~ plugins_folder
            let folder_pass = 1
        else
            let folder_pass = 0
        endif
    " For testing the url paste concerns a vim plugin:
        if paste_buffer =~ github_address
        " if buffer_folder =~ plugins_folder
            let url_pass = 1
        else
            let url_pass = 0
            " return a:url_pass
        endif
"===== 10 Activity
"====== 10 Alter
    " Print results
        if folder_pass && url_pass == 1
            execute "normal! oPlug \'\'\<Esc>\"+P=="
            " echo 'success'
        else
            execute "normal! p"
            " echo 'boo'
        endif
"===== 60 System
"====== 10 End Function
    endfunction
"====== Cruft
            " echo 'next' url_pass
            " echo folder_pass == url_pass ? 'poo' : 'taa'

            " echo folder_pass 'next' url_pass
            " if n=~ '60_System/60_Plugins/production'
            "     if o=~ 'github.com'
            "         return test
            "     else
            "         echo 'not github'
            "     endif
            " " else
            "     nnoremap p inb UltiSnips#ExpandSnippet<ESC>P
            "     echo n
            "     echo 'in production folder'
            "     echo o
            " else
            "     echo 'not in production folder'
            " endif
            " if m
            " :pwd<CR>
                " echo 'this is a test'
            " let m = visualmode()
            " if m ==# 'v'
            "     echo 'character-wise visual'
            " elseif m == 'V'
            "     echo 'line-wise visual'
            " elseif m == "\<C-V>"
            "     echo 'block-wise visual'
            " endif
"=== 60 Paste Tools
"==== 60 Yankring
        let g:yankring_history_dir = '~/20_Content/60_Vim-Qiuy/yankring'
"= 20 Replace
"== 40 Movement
"=== 60 Find Tools
"==== 60 Find-N-Replace
    " Not sure if functional, so set uncommented
        " " let g:fnr_flags   = 'gc'
        " let g:fnr_hl_from = 'Todo'
        " let g:fnr_hl_to   = 'IncSearch'et g:task_rc_override
        " = 'rc.defaultheight=0'
"= 10 Transform
"== 10 Shift
"=== 10 Selections
    " DragVisuals Mapping Information
        runtime plugin/dragvisuals.vim
