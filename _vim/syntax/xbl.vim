" Vim syntax file
" Language:	XBL build file (xml)
" Maintainer:	Kurt M. Brown, http://www.x2ii.info, <kurtb149@yahoo.com>
" Last Change:  2006-09-25 15:00:00
" $Id: xbl.vim 40 2006-09-25 19:36:50Z unicinfo $

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

let s:xbl_cpo_save = &cpo
set cpo&vim

runtime! syntax/xml.vim

syn case ignore

if !exists('*XblSyntaxScript')
    fun XblSyntaxScript(tagname, synfilename)
	unlet b:current_syntax
	let s:include = expand("<sfile>:p:h").'/'.a:synfilename
	if filereadable(s:include)
	    exe 'syn include @xbl'.a:tagname.' '.s:include
	else
	    exe 'syn include @xbl'.a:tagname." $VIMRUNTIME/syntax/".a:synfilename
	endif

	exe 'syn region xbl'.a:tagname
		    \.' start="<!\[CDATA\["'
		    \.' end="\]\]>"'
		    \.' fold'
		    \.' contains=@xbl'.a:tagname.',xmlCdataStart,xmlCdataEnd,xmlTag,xmlEndTag'
	exe 'syn cluster xmlRegionHook add=xbl'.a:tagname
    endfun
endif

" TODO: add more script languages here ?
call XblSyntaxScript('javascript', 'javascript.vim')

syn cluster xmlTagHook add=xblElement

syn keyword xblElement place_holder_here_ok

hi def link xblElement Statement

let b:current_syntax = "xbl"

let &cpo = s:xbl_cpo_save
unlet s:xbl_cpo_save

" vim: ts=4
