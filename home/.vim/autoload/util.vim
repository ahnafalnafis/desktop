vim9script

# Real names of following file types.
var filetypes = {
    asm:              "Assembly",
    c:                "C",
    cpp:              "C++",
    css:              'CSS',
    html:             'HTML',
    javascript:       "JavaScript",
    javascriptreact:  "JavaScript React",
    php:              'PHP',
    scss:             'SCSS',
    typescript:       "TypeScript",
    typescriptreact:  "TypeScript React",
    vim:              "VimScript",
}

export def RealFileType(ft: string): string
  # Returns the real file type of given file type.
  if has_key(filetypes, ft)
      return filetypes[ft]
  else
      return substitute(
      ft,
      '\<\(\w\)\(\w*\)\>',
      '\u\1\L\2',
      '/g'
      )
  endif
enddef

export def Notify(message: string): void
    # Shows message in Vim's command-line.
    echohl ModeMsg
    echomsg message
    echohl None
enddef

export def Loaded(plugin: string): bool
    # Checks if a plugin those loads with "loaded_<PLUGIN_NAME>"
    # loaded or not.
    var __plugin__ = 'loaded_' .. plugin
    return exists('g:' .. __plugin__) && get(g:, __plugin__)
enddef
