" 1998 Nov 08  15:22:18  Sun (unix)
"
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM/_vimrc ; $HOME/.vimrc

execute pathogen#infect()
syntax on
filetype plugin indent on
" Syntax & File Types
if (version >= 500)
    " .gvimrc is executed after this so &bg decision must be made here
    set bg=dark

    " let c_comment_strings=1
    let is_fvwm2 = 1        " I use fvwm2, not fvwm1
 
    " vim v5.4 only:
    " Next line must occur before any ":filetype on" or ":syntax on" commands
    let myfiletypefile = "$HOME/.vimrc_filetypes"

    " source $HOME/.vimrc_syntax after default syntax files are executed
    let mysyntaxfile = "$HOME/.vimrc_syntax"
   
    syntax on -- will be done in .gvimrc
endif

set hls
set nu
set nocompatible        " Use Vim defaults (much better!)
set viminfo='20,\"50,%,n$HOME/.viminfo
set nobackup            " keep a backup file
set bs=2                " allow backspacing over everything in insert mode
set ru                  " ruler on
set ch=3                " cmdheight
set ls=2                " laststatus (always show status line)
set is                  " incsearch on
set sbr=\ \             " showbreak (prefix for wrapped lines)
if ($OSTYPE != "linux")
    set vb                  " visualbell (flash instead of beep)
endif

" Coding
set tags=./tags,tags,$IMAGEBIN/index/tags   " $IMAGEBIN = /image/bin.6.4/
set sft                 " showfulltag (include entire line for function match)
set notbs               " tagbsearch (don't assume that tag files are sorted)

" set path=.,/usr/include,,/vobs/devel/include,$HOME/code/include,$HOME/code/include/SUNWspro,$HOME/code/include/stl,/usr/openwin/include
set path=.,/usr/include,,/vobs/devel/include,$HOME/code/include,$HOME/code/include/SUNWspro,$HOME/code/include/stl,/Progra~1/MI017E~1/VC98/Include
set dict=/usr/share/dict/words      " files to look in for <C-X><C-K>
set cpt=.,b             " complete (<C-N/P> looks in current and loaded bufs)
set noaw                " no autowrite (don't automatically write b4 makes)

set sw=4                " shiftwidth
set ts=4                " tabstop
set tw=78               " textwidth
set cink=0{,0},:,0#,!^F,o,O,e  " cinkeys (use default including 0#)
set nows                " no wrapscan
set noai                " no autoindenting (gq formatting works better for ¶'s)

set so=2                " scroll off (always keep 2 lines of context around)
set wh=12               " winheight (soft minimum for window height)
set noea                " equalalways off (windows don't resize on split/quit)
set sc                  " showcmd
set nohls               " highlight search
set lcs=eol:¶,tab:>.,trail:_,extends:»  " listchars to show in list mode
set cindent
set autoindent
set showmatch
"============================= Key mappings
"
" None  Normal, Visual and Operator-pending
" n     Normal
" v     Visual
" o     Operator-pending
" !     Insert and Command-line
" i     Insert
" c     Command-line

mapclear
" cnoremap <Tab>  <C-L><C-D>
cnoremap    <Tab>   <C-L>
nnoremap    <F6>    :set list!<CR>
inoremap    <F6>    <C-O>:set list!<CR>
nnoremap    <S-F6>  :set hls! \| set hls?<CR>
inoremap    <S-F6>  <C-O>:set hls! \| set hls?<CR>
nnoremap    <F5>    :set et! \| set et?<CR>
inoremap    <F5>    <C-O>:set et! \| set et?<CR>
nnoremap    <F7>    :set wrap! \| set wrap?<CR>
inoremap    <F7>    <C-O>:set wrap! \| set wrap?<CR>
nnoremap    <S-F7>  :set nu! \| set nu?<CR>
inoremap    <S-F7>  <C-O>:set nu! \| set nu?<CR>

if has("unix")
    nnoremap    ,rce    :split  ~/.vimrc <Bar> resize _<CR>61G
    nnoremap    ,rcu    :source ~/.vimrc <Bar> source ~/.gvimrc<CR>
    vnoremap    <F9>    :write! ~/tmp/.vim_clip<CR>
    nnoremap    <S-F9>  :read ~/tmp/.vim_clip<CR>
else
    nnoremap    ,rce    :split  $HOME/.vimrc <Bar> resize _<CR>61G
    nnoremap    ,rcu    :source $HOME/.vimrc <Bar> source $HOME/.gvimrc<CR>
    vnoremap    <F9>    :write! /tmp/.vim_clip<CR>
    nnoremap    <S-F9>  :read   /tmp/.vim_clip<CR>
    nnoremap    ,pr     :set key= \| write /tmp/print/%:p:t<CR>
endif

if has("unix")
    if ($OSTYPE == "linux")
        nnoremap    ,sq     :%!cat -s<CR>
        vnoremap    ,sq     :!cat -s<CR>
    else
        " have some internal VIM function to squeeze out double empty lines
    endif

    " vnoremap    ,sp y:new<CR>p:%! ispell -a<CR>
    nnoremap    ,sp     o---<ESC>:!echo "<cword>" \| ispell -a<CR>
    nnoremap    ,asp    Go---<ESC>:r!ispell -l < %<CR>
endif


" --- Movements (screen & buffers)
" (Many mappings are just Norm & Vis mode, no Op-Pending)

noremap     ,/      /\<\><Left><Left>
ounmap      ,/
noremap     ,?      ?\<\><Left><Left>
ounmap      ,?
" noremap     n       nz.
" ounmap      n
" noremap     N       Nz.
" ounmap      N

nnoremap    <C-Right>   :bnext<CR>
nnoremap    <C-Left>    :bprev<CR>
nnoremap    ,bn         :bnext<CR>
nnoremap    ,bp         :bprev<CR>
nnoremap    <C-Up>      <C-W>k
nnoremap    <C-Down>    <C-W>j
noremap     j       gj
ounmap      j
noremap     k       gk
ounmap      k
noremap     '       `
ounmap      '

" noremap     <C-D>   Lkz<CR>
" ounmap      <C-D>
" noremap     <C-U>   Hjz-
" ounmap      <C-U>

nnoremap    ,tn     :tnext<CR>
nnoremap    ,tp     :tprev<CR>
nnoremap    ,cn     :cnext<CR>
nnoremap    ,cp     :cprev<CR>
nnoremap    ,[{     100[{z.
vnoremap    ,[{     100[{z.


" --- Text Manipulation
nnoremap    <F2>    @a
noremap     <F8>    :g/^/norm 
ounmap      <F8>
" collapse consecutive empty (or tab only) lines
noremap     <S-F8>  :g/^[\t ]*$/,/[^\t ]/-j<CR>
" noremap     <S-F8>  :g/^$/.,/./-1join<CR>
ounmap      <S-F8>

" noremap _g  :let efsave=&ef<Bar>let &ef=tempname()<Bar>exe ':!grep -n -w "<cword>" *.[ch] *.txt >'.&ef<CR>:cf<CR>:exe ":!rm ".&ef<CR>:let &ef=efsave<Bar>unlet efsave<CR><CR>:cc<CR>
"nnoremap <F3> :set noet<CR>A<< <C-R>=line(".")<CR>, <ESC>0%:let @b=line(".")<CR>%A<C-R>b >><ESC>0=%%o<ESC>j

nnoremap    ,yw     "*yiw
nnoremap    ,mif    :%s/</{/g \| %s/>/}/g<CR>
nnoremap    ,sub    :%s/\<LT>\>/<Left><Left><Left>
nnoremap    ,e      :e <C-R>=expand("%:p:h") . "/"<CR>
nnoremap    ,sp     :sp <C-R>=expand("%:p:h") . "/"<CR>

"                            |diff|
"  vi -o newfile oldfile ->  |new |
"                            |old |
map ,df   <C-W>k<C-W>j:!diff -C 4 <C-R>% <C-R># > /tmp/vimtmp.dif<C-M><C-W>k<C-W>s:e! /tmp/vimtmp.dif<C-M>:!/bin/rm /tmp/vimtmp.dif<C-M><C-M>
 
" F8 : --dif file--     Makes current diff
"      --new file--     block show up in
"      --old file--     both windows
map ,dg  <C-W>k<C-W>k?^\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*$<CR>jYpdwf,DAGz<C-V><CR><Esc>"aYdd<C-W>j<C-W>j@a<C-W>k<C-W>k?^\*\*\*\*<CR>/^--- <CR>Ypdwf,DAGz<C-V><CR><Esc>"aYdd<C-W>j@a<C-W>kuuz<CR>


" --- Miscellaneous Mappings
" cnoreab     chfn    set guifont=lucida_sans_typewriter:h
cnoreab     chfn    set guifont=Lucida_Console:h


"============================= Abbreviations
"
iabclear

if has("unix") && ($OSTYPE == "linux")
    iab         Yperl       #!/usr/bin/perl
    iab         Ytcsh       #!/bin/tcsh -f
    iab         Ycsh        #!/bin/csh -f
    iab         Ysh         #!/bin/sh -f
elseif has("unix")
    iab         Ytcsh       #!/usr/local/bin/tcsh -f
    iab         Ycsh        #!/usr/bin/csh -f
    iab         Ysh         #!/usr/bin/sh -f
    iab         Yperl       #!/pd/osbin/perl5
endif

iab         Ydate       <C-r>=strftime("%Y %b %d  %H:%M:%S  %a")<CR>
iab         Ydat        <C-r>=strftime("%Y-%m-%d %a")<CR>



"============================= Autocommands
"
"   For "regular" files switch autoformatting to defaults
"   Don't change the order, it's important that the line with * comes first.

" formatoptions: (tcql default)
"   t (autowrap to textwidth)       c (autowrap comments)
"   o (ins comment on open)         r (ins comment on CR)
"   l (don't break long lines)      q (gq format comments)
"   2 (base indent on 2nd line)
au BufEnter,BufRead,BufNewFile  *   set et nosm fo=tcorql nocin com&
au BufEnter,BufRead,BufNewFile  *   noremap ,{  :?^{??^\k.*(? mark k \| echo getline("'k")<CR>
au BufEnter,BufRead,BufNewFile  *   ounmap  ,{

" assume commented lines begin with # (we can always change this later)
au BufEnter  *  noremap     <F4>    :s@\(.*\)@# \1<CR>j
au BufEnter  *  ounmap      <F4>
au BufEnter  *  noremap     <S-F4>  :s@^\s*#\s\=\(.*\)\s*$@\1<CR>j
au BufEnter  *  ounmap      <S-F4>


au BufEnter,BufRead,BufNewFile  .Xdefaults      set et fo=tcorql com=:!
au BufEnter,BufRead,BufNewFile  .Xresources     set et fo=tcorql com=:!
au BufEnter,BufRead,BufNewFile  .cshrc          set et fo=tcorql com=:#
au BufEnter,BufRead,BufNewFile  .aliases        set et fo=tcorql com=:#
au BufEnter,BufRead,BufNewFile  .completions    set et fo=tcorql com=:#
au BufEnter,BufRead,BufNewFile  .fvwm2rc        set et fo=tcorql com=:#
au BufEnter,BufRead,BufNewFile  *.l     set sm fo=croql cin com=sr:/*,mb:*,el:*/
au BufEnter,BufRead,BufNewFile  .procmailrc     set et fo=tcorql com=n:#
au BufEnter,BufRead,BufNewFile  [Mm]akefile*        set noet fo=corq com=:#
au BufEnter,BufRead,BufNewFile  skel.[Mm]akefile*   set noet fo=corq com=:#
au BufEnter,BufRead,BufNewFile *.csh    set noet fo=corq com=:#

au BufNewFile  [Mm]akefile*     0read $HOME/code/skel/skel.Makefile
au BufNewFile *.csh             0read $HOME/code/skel/skel.csh
au BufNewFile *.sh              0read $HOME/code/skel/skel.sh
au BufNewFile *.load            0read $HOME/code/skel/skel.load


augroup vim
    au!
    au BufEnter,BufRead,BufNewFile  .*vimrc     set et fo=tcorql com=:\"
    au BufEnter  .*vimrc    noremap     <F4>    :s@\(.*\)@" \1@<CR>j
    au BufEnter  .*vimrc    ounmap      <F4>
    au BufEnter  .*vimrc    noremap     <S-F4>  :s@^\s*"\s\=\(.*\)$@\1@<CR>j
    au BufEnter  .*vimrc    ounmap      <S-F4>
augroup END


augroup pineGrp
    au!
    au BufEnter,BufRead,BufNewFile  pico.[0-9]*     set tw=70 ts=4 sw=4 ai com=n:>,fb:- fo=tcql
    au BufLeave  pico.[0-9]*    set tw=0 ts=4 sw=4 noai
    au BufEnter  pico.[0-9]*    noremap     <F4>    :s@\(.*\)@> \1@<CR>j
    au BufEnter  pico.[0-9]*    ounmap      <F4>
    au BufEnter  pico.[0-9]*    noremap     <S-F4>  :s@^\s*>\s\=\(.*\)$@\1@<CR>j
    au BufEnter  pico.[0-9]*    ounmap      <S-F4>
augroup END


" This is a biggie autogroup for C, C++, Java, and Teradyne ITL files
augroup cprog
    au!

    " set formatting for = command
    " *40 searches for unclosed comments up to 40 lines away for autoformatting
    au BufEnter,BufRead,BufNewFile  *.[hcly],*.hh,*.cpp,*.cc,*.java,*.tl  set sm fo=croql cin com=sr:/*,mb:*,el:*/,:// cino=t0,*40,g0
    " au BufEnter,BufRead,BufNewFile  *.[hcly],*.hh,*.cpp,*.cc,*.java,*.tl  set sm fo=croql cin com=sr:/*,mb:*,el:*/,:// cino=t0,(0,*40,g0

"     au BufEnter *.[hcly],*.hh,*.cpp,*.cc,*.java,*.tl    noremap ,{  :?^{??^\k.*(? mark k \| echo getline("'k")<CR>
"     au BufEnter *.[hcly],*.hh,*.cpp,*.cc,*.java,*.tl    ounmap  ,{

    " load program skeletons if available
    au BufNewFile  *.c          0read $HOME/code/skel/skel.c
    au BufNewFile  *.h          0read $HOME/code/skel/skel.h
    au BufNewFile  *.cc         0read $HOME/code/skel/skel.cc
    au BufNewFile  *.cpp        0read $HOME/code/skel/skel.cc
    au BufNewFile  *.hh         0read $HOME/code/skel/skel.hh
    au BufNewFile  *.java       0read $HOME/code/skel/skel.java
    au BufNewFile  *.l          0read $HOME/code/skel/skel.l
    au BufNewFile  *.y          0read $HOME/code/skel/skel.y
    au BufNewFile  *.tl         0read $HOME/code/skel/skel.tl
    if has("unix")
        au BufNewFile  *.C          0read $HOME/code/skel/skel.cc
    endif

    " comment & uncomment C-style
    au BufEnter  *.[chly],*.tl    noremap <F4>    :s@\(.*\)@/* \1 */@<CR>j
    au BufEnter  *.[chly],*.tl    ounmap  <F4>
    au BufEnter  *.[chly],*.tl    noremap <S-F4>  :s@^\s*/\*\s\=\(.\{-}\)\s*\*/$@\1@<CR>j
    au BufEnter  *.[chly],*.tl    ounmap  <S-F4>

    " comment & uncomment C++/Java style
    au BufEnter  *.hh,*.cpp,*.cc,*.java noremap <F4>    :s@\(.*\)@// \1@<CR>j
    au BufEnter  *.hh,*.cpp,*.cc,*.java ounmap  <F4>
    au BufEnter  *.hh,*.cpp,*.cc,*.java noremap <S-F4>  :s@^\s*//\s\=\(.*\)$@\1@<CR>j
    au BufEnter  *.hh,*.cpp,*.cc,*.java ounmap  <S-F4>
    if has("unix")
        au BufEnter  *.C    noremap <F4>    :s@\(.*\)@// \1@<CR>j
        au BufEnter  *.C    ounmap  <F4>
        au BufEnter  *.C    noremap <S-F4>  :s@^\s*//\s\=\(.*\)$@\1@<CR>j
        au BufEnter  *.C    ounmap  <S-F4>
    endif

    " C programming constructs
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iab     Ysbl    {<ESC>o}<ESC>O 
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iab     Ydef    <ESC>0i#define
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iab     Ydeb    <ESC>0i#ifdef DEBUG<CR>#endif<ESC>O
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iab     Ytype   typedef
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iab     Yinc    <ESC>0i#include <><Left>
    au BufEnter  *.java                                 iab     Yinc    <ESC>0iimport 
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iab     Yif     if () {<ESC>o}<ESC>k$2hi
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iab     Yelif   else if () {<ESC>o}<ESC>k$2hi
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iab     Yelse   else {<ESC>o}<ESC>O   
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iab     Yfor    for (;;) {<ESC>o}<ESC>kwa
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iab     Ywhile  while () do {<ESC>o}<ESC>k$5hi
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iab     Ymain   int<CR>main ( int argc, char *argv[] ) <ESC>o{<ESC>o}<ESC>Oreturn 0;<ESC>O
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iab     Ypr     printf("\n");<ESC>2F"a
    au BufEnter  *.[chCly],*.hh,*.tl                    iab     Yfpr    fprintf(FILE, "\n");<ESC>2F"a
    au BufEnter  *.java                                 iab     Ypr     System.out.print("");<ESC>2F"a
    au BufEnter  *.cpp,*.cc                             iab     Ypr     cout << "" << endl;<ESC>2F"a
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iab     Yepr    fprintf(stderr, "\n");<ESC>2F"a
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iab     Yfunc   void foo(  )<CR>{<CR>}<ESC>kk$T(a
    au BufEnter  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iab     Yass    ASSERT(  )<Left><Left>

    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iunab   Ysbl
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iunab   Ydef
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iunab   Ydeb
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iunab   Ytype
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iunab   Yinc
    au BufLeave  *.java                                 iunab   Yinc
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iunab   Yif
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iunab   Yelif
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iunab   Yelse
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iunab   Yfor
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iunab   Ywhile
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iunab   Ymain
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iunab   Ypr
    au BufLeave  *.[chCly],*.hh,*.tl                    iunab   Yfpr
    au BufLeave  *.java                                 iunab   Ypr
    au BufLeave  *.cpp,*.cc                             iunab   Ypr
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iunab   Yepr
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc,*.java  iunab   Yfunc
    au BufLeave  *.[chCly],*.hh,*.tl,*.cpp,*.cc         iunab   Yass
augroup END


augroup perlprog
    au!
    au BufEnter,BufRead,BufNewFile  *.pl    set sm fo=croql cin com=:# cino=*40
    au BufNewFile  *.pl     0read $HOME/code/skel/skel.pl
"         au FileWritePost,BufWritePost  *.pl     !chmod u+x %

    au BufEnter *.pl    noremap ,{   mk \| :?^\s*sub? print 3 \| norm `k<CR>
    au BufEnter *.pl    ounmap  ,{

    au BufEnter  *.pl   iab     Ypr  print STDOUT "\n";<ESC>2F"a
    au BufLeave  *.pl   iunab   Ypr
augroup END


augroup gzip
  au!

  " Enable editing of gzipped files
  "       read: set binary mode before reading the file
  "             uncompress text in buffer after reading
  "      write: compress file after writing
  "     append: uncompress file, append, compress file
  au BufReadPre,FileReadPre        *.gz set bin
  au BufReadPost,FileReadPost      *.gz '[,']!gunzip
  au BufReadPost,FileReadPost      *.gz set nobin
  au BufReadPost,FileReadPost      *.gz execute ":doautocmd BufReadPost " . %:r

  au BufWritePost,FileWritePost    *.gz !mv <afile> <afile>:r
  au BufWritePost,FileWritePost    *.gz !gzip <afile>:r

  au FileAppendPre                 *.gz !gunzip <afile>
  au FileAppendPre                 *.gz !mv <afile>:r <afile>
  au FileAppendPost                *.gz !mv <afile> <afile>:r
  au FileAppendPost                *.gz !gzip <afile>:r
augroup END

if (version >= 503)
    comc                    " clear user defined ex commands

    " Clearcase commands
    if ($CLEARCASE_ROOT != "")
        com!    Cdesc   !cleartool desc %
        com!    Chist   !cleartool lshist % | head -20
        com!    Cvtree  !cleartool lsvtree -g % &
        com!    Cdiff   !cleartool diff -g -vst -pre -opt "-b" % &
    endif

    if has("unix")
        com!    Chx !chmod u+x %
        com!    Chw !chmod u+w %
    endif


    com! -range Lcount echo "Visual block = " . (line("'>") - line("'<") + 1) . "  lines"
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE: 
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE: 
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>  

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR> 


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>   
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

filetype plugin on
set fileencodings=utf8,gbk,big5,latin1,gb18030
set fileencoding=utf8
set <C-u>=^U
set <C-b>=^B
map <C-u> :set fileencoding=utf8
map <C-b> :set fileencoding=big5
set hlsearch
map <f9> :Tlist<CR>
