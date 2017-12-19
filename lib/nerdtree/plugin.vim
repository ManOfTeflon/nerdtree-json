let s:Plugin = {}
let g:NERDTreePlugin = s:Plugin

function! NERDTreeCreatePlugin()
    return copy(s:Plugin)
endfunction

function! s:Plugin.New()
    let obj = copy(self)
    return obj
endfunction

function! s:Plugin.ParsePath(str)
    let creator = g:NERDTreeCreator.New()

    return creator._pathForString(a:str, self)
endfunction

function! s:Plugin.Chdir(path)
    call a:path.changeToDir()
endfunction

function! s:Plugin.Activate(path)
    call a:path.edit()
endfunction

function! s:Plugin.DeleteNode(node)
    call a:node._delete()
endfunction

function! s:Plugin.RenameNode(node, newName)
    call a:node._rename(a:newName)
endfunction

function! s:Plugin.ListChildren(path)
    let node = g:NERDTreeDirNode.New(a:path, {})

    return node._glob('*', 1) + node._glob('.*', 0)
endfunction

