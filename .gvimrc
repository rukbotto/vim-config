if has('gui_macvim')
  set guifont=Monaco:h13

  macm File.New\ Tab key=<Nop>
  macm File.Open\.\.\. key=<Nop>
  macm File.Open\ Tab\.\.\. key=<Nop>
  macm File.Close\ Window key=<Nop>
  macm File.Close key=<Nop>
  macm File.Save key=<Nop>
  macm File.Save\ As\.\.\. key=<Nop>
  macm File.Save\ All key=<Nop>
  
  macm Edit.Undo key=<Nop>
  macm Edit.Redo key=<Nop>
  macm Edit.Cut key=<Nop>
  macm Edit.Copy key=<Nop>
  macm Edit.Paste key=<Nop>
  macm Edit.Select\ All key=<Nop>
  
  macm Edit.Find.Find\.\.\. key=<Nop>
  macm Edit.Find.Find\ Next key=<Nop>
  macm Edit.Find.Find\ Previous key=<Nop>
  macm Edit.Find.Use\ Selection\ for\ Find key=<Nop>
  
  macm Tools.Make key=<Nop>
  macm Tools.List\ Errors key=<Nop>
  macm Tools.Next\ Error key=<Nop>
  macm Tools.Previous\ Error key=<Nop>
  macm Tools.Older\ List key=<Nop>
  macm Tools.Newer\ List key=<Nop>
  
  macm Tools.Spelling.To\ Next\ error key=<Nop>
  macm Tools.Spelling.Suggest\ Corrections key=<Nop>

  macm Window.Select\ Next\ Tab key=<Nop>
  macm Window.Select\ Previous\ Tab key=<Nop>
endif

if has("autocmd")
    autocmd! BufWritePost .gvimrc source $MYGVIMRC
endif
