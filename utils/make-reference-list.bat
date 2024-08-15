@ echo off

if "%1"=="--help" goto :help
if "%1"=="-h" goto :html-output
if "%1"=="--html" goto :html-output
if "%1"=="-d" goto :docx-output
if "%1"=="--docx" goto :docx-output

:help
echo options:
echo    -h --html       html output
echo    -d --docx       docx output
echo       --help       show this menu
exit /b 0

set all-formats=pandoc --citeproc references.bib --metadata title="References" --csl=american-fisheries-society.csl 

:html-output
%all-formats% --css reference-styles.css -o reference-list.html --standalone
exit /b 0

:docx-output
%all-formats% --reference-doc=wordtemplate.docx -o reference-list.docx
exit /b 0
