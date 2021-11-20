function! DendronCreateWorkspace(workspace)
    " Initialise a workspace with a specified directory name.
    " We don't yet check if the directory already exists.
    let ws = a:workspace
    if (len(ws) == 0)
        let ws = input("Workspace name:")
    endif
    call mkdir(ws)
    call system("dendron workspace init --wsRoot " . ws)
    echon "Created new dendron workspace in ".ws.'!'
endfunction
