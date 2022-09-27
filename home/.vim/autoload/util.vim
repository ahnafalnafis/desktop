vim9script

var filetypes = {
  javascript: "JavaScript",
  typescript: "TypeScript",
  javascriptreact: "JavaScript React",
  typescriptreact: "TypeScript React",
  vim: "VimScript",
  c: "C",
  cpp: "C++",
  asm: "Assembly",
}

# Message notifier:
export def Notify(message: string): void
  echohl ModeMsg
  echomsg message
  echohl None
enddef

export def RealName(ft: string): string
  if has_key(filetypes, ft)
    return filetypes[ft]
  else
    return ft
  endif
enddef

export def Loaded(plugin: string): bool
  var __plugin__ = 'loaded_' .. plugin
  return exists('g:' .. __plugin__) && get(g:, __plugin__)
enddef
