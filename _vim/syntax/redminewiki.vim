" Vim syntax file for Redmine wiki
"
" Language:     Redmine wiki
" Maintainer:   Petr Zemek <s3rvac@gmail.com>
" Last Change:  2013-10-18 15:51:05 +0200
" Version:      0.1
"
" Heavily based on the textile.vim syntax file by Kornelius Kalnbach
" <korny@cYcnus.de>, Mar 2006.
"
" The MIT License (MIT)
"
" Copyright (c) 2013 Petr Zemek
" Copyright (c) 2006 Kornelius Kalnbach
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" Quit if the syntax file has already been loaded
if exists("b:current_syntax")
	finish
endif

" Commands like "h1" are case sensitive
syn case match

" =============================================================================
" Matches/regions
" =============================================================================

syn match redmineGlyph /\(\s\@<=\([-x]\)\s\@=\|\.\.\.\|(\(TM\|R\|C\))\)/

syn region redmineAcronym matchgroup=redmineAcronymTag start=/\<\u\{3,}(/ end=/)/

syn cluster RedmineFormatTags contains=redmineLink,redmineImage,redmineAncronym,redmineEm,redmineStrong,redmineItalic,redmineBold,redmineCode,redmineSubtext,redmineSupertext,redmineCitation,redmineDeleted,redmineInserted,redmineSpan,redmineNoTextile,redmineGlyph,redmineAcronym,redmineHtml

syn region redmineSpan oneline matchgroup=redmineFormatTagSpan contains=redmineSpanKeyword start=/\w\@<!%\s\@!/ end=/\s\@<!%\w\@!/

syn region redmineEm oneline matchgroup=redmineFormatTag start=/\w\@<!_\s\@!/ end=/\s\@<!_\w\@!/ contains=@RedmineFormatTags
syn region redmineStrong oneline matchgroup=redmineFormatTag start=/\w\@<!\*\s\@!/ end=/\s\@<!\*\w\@!/ contains=@RedmineFormatTags
syn region redmineItalic oneline matchgroup=redmineFormatTag start=/\w\@<!__\s\@!/ end=/\s\@<!__\w\@!/ contains=@RedmineFormatTags
syn region redmineBold oneline matchgroup=redmineFormatTag start=/\w\@<!\*\*\s\@!/ end=/\s\@<!\*\*\w\@!/ contains=@RedmineFormatTags

syn region redmineCode oneline matchgroup=redmineFormatTag start=/\w\@<!@\s\@!/ end=/\s\@<!@\w\@!/
syn region redmineSubtext oneline matchgroup=redmineFormatTag start=/\w\@<!\~\s\@!/ end=/\s\@<!\~\w\@!/
syn region redmineSupertext oneline matchgroup=redmineFormatTag start=/\w\@<!\^\s\@!/ end=/\s\@<!\^\w\@!/
syn region redmineCitation oneline matchgroup=redmineFormatTag start=/\w\@<!??\s\@!/ end=/\s\@<!??\w\@!/
syn region redmineDeleted oneline matchgroup=redmineFormatTag start=/\w\@<!-\s\@!/ end=/\s\@<!-\w\@!/
syn region redmineInserted oneline matchgroup=redmineFormatTag start=/\w\@<!+\s\@!/ end=/\s\@<!+\w\@!/

syn match redmineHtml /<\/\=\w[^>]*>/
syn match redmineHtml /&\w\+;/

syn region redmineCode matchgroup=redmineTag start="<pre[^>]*>" end="</pre>"
syn region redmineCode matchgroup=redmineTag start="<code[^>]*>" end="</code>"

syn region redmineNoTextile matchgroup=redmineTag start=/\w\@<!==\s\@!/ end=/\s\@<!==\w\@!/
syn region redmineNoTextile matchgroup=redmineTag start="<notextile>" end="</notextile>"

syn match redmineHR /^-\{3,}/

syn region redmineMacro matchgroup=redmineTag start="!\?{{" end="}}"

syn region redmineH start=/^\(h[1-6]\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\.\( \|$\)\)\@=/ skip=/\n\n\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags,redmineKeyword
syn region redmineP start=/^\(p\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\.\( \|$\)\)\@=/ skip=/\n\n\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags,redmineKeyword
syn region redmineBQ start=/^\(bq\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\.\( \|$\)\)\@=/ skip=/\n\n\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags,redmineKeyword
syn region redmineListItem matchgroup=redmineListDot start=/^\*\+\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\( \|$\)/ skip=/\n\(\*\|\n\)\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags
syn region redmineListItem matchgroup=redmineListDot start=/^#\+\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\( \|$\)/ skip=/\n\(#\|\n\)\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags
syn region redmineTable start=/^\(table\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[<>=]\)*\.\( \|$\)\)\@=/ skip=/\n\n\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags,redmineKeyword

syn region redmineKeyword contained start=/^\(bq\>\|p\>\|h[1-6]\>\|#\+\|\*\+\|table\>\)/ skip=/\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]/ end=/\.\=/ contains=redmineArg,redmineLang,redmineClass,redmineIndent,redmineArgError
syn region redmineSpanKeyword contained start=/\(\w\@<!%\s\@!\)\@<=/ skip=/\[[^\]]*\]\|{[^}]*}\|([^)]*)\|(\+\|)\+\|[<>=]/ end=/./ contains=redmineArg,redmineLang,redmineClass,redmineIndent,redmineArgError
syn region redmineArg contained matchgroup=redmineBrace start=/{}\@!/ end=/}/
syn match redmineIndent contained /[()]\+\|[<>=]/
syn region redmineClass contained matchgroup=redmineBrace start=/()\@!\([^)]\+)\)\@=/ end=/)/
syn region redmineLang contained matchgroup=redmineBrace start=/\[\]\@!/ end=/\]/
syn match redmineArgError contained /{}\|\[\]\|()/
syn match redmineRestOfBlock contained /\_.*/ transparent

syn match redmineImage /![^!(]*\(([^)]*)\)\=!/ contains=redmineImageURL
syn region redmineImageURL matchgroup=redmineFormatTag contained contains=redmineImageTitle start=/!/ skip=/([^(])/ end=/!/ nextgroup=redmineLinkColon
syn region redmineImageTitle matchgroup=redmineFormatTag contained start="(" end=")"

" Link with a name
syn match redmineLink /"[^"]*":\S*[[:alnum:]_\/]/ keepend contains=redmineLinkName
syn region redmineLinkName matchgroup=redmineBrace contained start=/"/ end=/"/ contains=@RedmineFormatTags nextgroup=redmineLinkColon
syn match redmineLinkColon contained /:/ nextgroup=redmineLinkURL
syn match redmineLinkURL contained /.*/

" Standalone link
syn match redmineLink "\<\%(\%(\%(https\=\|file\|ftp\|gopher\)://\|\%(mailto\|news\):\)[^[:space:]'\"<>]\+\|www[[:alnum:]_-]*\.[[:alnum:]_-]\+\.[^[:space:]'\"<>]\+\)[[:alnum:]/]" contains=@NoSpell

" Standalone email address
syn match redmineLink /[[:alnum:]._%+-]\+@[[:alnum:].-]\+\.[[:alnum:]]\+/ contains=@NoSpell

" Wiki links
syn match redmineWikiLink /\[\[[^\]]\+\]\]/ contains=redmineWikiLinkURL
syn region redmineWikiLinkURL matchgroup=redmineFormatTag contained contains=redmineWikiLinkTitle start=/\[\[/ end=/\]\]\?/
syn region redmineWikiLinkTitle matchgroup=redmineFormatTag contained start=/[|:]/ end=/\]/

" Links to other resources
" TODO This may need to be fine-tuned
syn match redmineResourceLink /\<\([[:alnum:]]\+:\)\?\(document\|version\|attachment\|news\|project\|message\|forum\|source\|export\|commit\)\(:"[^"]\+"\|:[[:alnum:]/@#|_.-]\+\|#[1-9][0-9]*\)/
syn match redmineResourceLink /\<\([[:alnum:]]\+[:|]\)\?r[1-9][0-9]*/ contains=@NoSpell
syn match redmineResourceLink /#[1-9][0-9]*/

" =============================================================================
" Highlighting
" =============================================================================

hi def link redmineTag Special
hi def link redmineFormatTag Special
hi def link redmineNoTextile Normal

hi def link redmineEm redmineItalic
hi def link redmineStrong redmineBold
hi def link redmineItalic redmineMakeItalic
hi def link redmineBold redmineMakeBold
hi def link redmineCode String

hi def link redmineSubtext String
hi def link redmineSupertext String
hi def link redmineCitation String
hi def link redmineDeleted String
hi def link redmineInserted redmineUnderline

hi def link redmineSpan Normal
hi def link redmineFormatTagSpan redmineTag

hi def link redmineH Title
hi def link redmineHTag redmineTag
hi def link redmineP Normal
hi def link redminePTag redmineTag
hi def link redmineBQ Normal
hi def link redmineBQTag redmineTag
hi def link redmineListDot Special
hi def link redmineTable Normal
hi def link redmineTableTag redmineTag

hi def link redmineKeyword Special
hi def link redmineArg Type
hi def link redmineClass Statement
hi def link redmineLang String
hi def link redmineIndent String
hi def link redmineArgError Error
hi def link redmineBrace Special
hi def link redmineRestOfBlock Number

hi def link redmineLink Underlined
hi def link redmineLinkName String
hi def link redmineLinkColon redmineBrace
hi def link redmineLinkURL Underlined

hi def link redmineWikiLink Underlined
hi def link redmineWikiLinkURL Underlined
hi def link redmineWikiLinkTitle String
hi def link redmineResourceLink Underlined

hi def link redmineImage Statement
hi def link redmineImageURL redmineLink
hi def link redmineImageTitle String

hi def link redmineGlyph Special
hi def link redmineHR Title
hi def link redmineAcronym String
hi def link redmineAcronymTag Special

hi def link redmineHtml Special

hi def link redmineMacro String

hi def redmineMakeBold term=bold cterm=bold gui=bold
hi def redmineBoldUnderline term=bold,underline cterm=bold,underline gui=bold,underline
hi def redmineBoldItalic term=bold,italic cterm=bold,italic gui=bold,italic
hi def redmineBoldUnderlineItalic term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
hi def redmineUnderline term=underline cterm=underline gui=underline
hi def redmineUnderlineItalic term=italic,underline cterm=italic,underline gui=italic,underline
hi def redmineMakeItalic term=italic cterm=italic gui=italic
hi def redmineLink term=underline cterm=underline gui=underline

" =============================================================================

" Make sure that the file is loaded at most once
let b:current_syntax = "redmine"
