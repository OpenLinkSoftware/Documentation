@echo off
setlocal

rem ***        CONFIGURABLE SECTION add your profile here ***

echo %COMPUTERNAME%%USERNAME%

if %COMPUTERNAME% == ASH set docroot=d:\openlink\virtuoso\docdb\docsrc\uda45

echo using: %docroot%
rem *** end of CONFIGURABLE SECTION ***

set xsls=%docroot%\stylesheets
set xmls=%docroot%\mt
set docbookxsl=%xsls%\docbook
set relnotes=%docroot%\releasenotes
set imgroot=../images/
set imgrootmt=../images/mt/
set imgrootlite=../images/lite/

if not exist %docroot%\readme.html goto error

echo ==========================================
echo Initializing output tree
mkdir %docroot%\output\
mkdir %docroot%\output\mt
mkdir %docroot%\output\lite
rem xcopy /y %docroot%\html_virt_mt\*.* %docroot%\output\mt
rem xcopy /y %docroot%\html_virt_lite\*.* %docroot%\output\lite

echo if doc files are not already in output directory then remake them from Virtuoso scripts

mkdir %docroot%\output\pdf

mkdir %docroot%\output\images
xcopy /e /y /v /c /r %docroot%\images %docroot%\output\images

echo ==========================================
echo Creating pdf html sources + pdf  files
echo ------------------------------------------
d:\bin\htmldoc --batch %docroot%\pdf\mtdocs.book
d:\bin\htmldoc --batch %docroot%\pdf\litedocs.book

pushd %docroot%\output

tar cfz uda45.tgz images lite mt pdf
popd

endlocal
