@ echo off

:all-files
set pandoc-call=pandoc --citeproc references.bib --metadata title="References" 
if "%2"=="" (
    set csl=--csl=american-fisheries-society.csl 
    goto :choose-output
)
set csl=--csl=%2

:choose-output
if "%1"=="--help" goto :help
if "%1"=="-h" goto :html-output
if "%1"=="--html" goto :html-output
if "%1"=="-d" goto :docx-output
if "%1"=="--docx" goto :docx-output
if "%1"=="-m" goto :md-output
if "%1"=="--md" goto :md-output

:help
echo usage: make-reference-list ^<output^> ^<csl^> 
echo:
echo output options:
echo    -h --html       html output
echo    -d --docx       docx output
echo    -m --md         markdown output
echo:
echo csl: defaults to american-fisheries-society.csl
echo:
echo       --help       show this menu
exit /b 0

:html-output
%pandoc-call% %csl% --css reference-styles.css -o reference-list.html --standalone
exit /b 0

:docx-output
%pandoc-call% %csl% --reference-doc=wordtemplate.docx -o reference-list.docx
exit /b 0

:md-output
call :html-output 
pandoc reference-list.html -o reference-list.md -t markdown_strict
exit /b 0
