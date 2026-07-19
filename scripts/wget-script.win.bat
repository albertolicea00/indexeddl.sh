@echo off
chcp 65001>nul



	

:intro
echo.
echo.
echo 🚀🚀🚀 Welcome to the IndexedDirectory Web Scraper Tool for WindowsOS! 🚀🚀🚀
echo.
echo This powerful tool allows you to download files from any Indexed Directory's web. 
echo It supports a wide range of file types, including images, audios, videos, subtitles, text files, programming files, archive files, and web files.
echo You can choose to download custom file types or select from the predefined categories.
echo The software uses wget to perform the downloads, so you'll need to have "wget" installed on your system.
echo Please note that some websites may not be compatible with this tool if they load files using JavaScript.
echo Here are some tested websites for you to try:
echo 1. https://visuales.uclv.cu/
echo 2. https://mochila.uclv.cu/
echo.
echo Let's get started!
echo.


:test
where /q wget
if %ERRORLEVEL% NEQ 0 (
	echo ❌ wget is not installed. Please install "wget" and try again.
	echo Please visit the followings URL for instructions on how to download and install wget:
	echo -^>	https://www.gnu.org/software/wget/
	echo -^>	https://eternallybored.org/misc/wget/
	timeout /t 15 /nobreak >nul
	exit /b
)


:url_define
echo 🔸 Enter the full path to download from any Indexed Directory's web 📂...
set /p url="> "
if "%url%"=="" (
    echo Please enter a URL.
    goto url_define
)

:options

set imageFormats=jpg,png,gif,tiff,bmp,svg,webp,ico,jpeg,heif
set audioFormats=mp3,aac,wav,flac,alac,ogg,aiff,m4a,wma,aac,mp3,wav
set videoFormats=mp4,avi,mov,wmv,flv,mkv,webm,mpeg,3gp,amv,mpeg,flv,avi
set subtitleFormats=srt,sub,vtt
set textFormats=doc,docx,rtf,pdf,wpd,txt,odt,xml,xlsx,csv
set programmingFormats=set programmingFormats=c,cpp,java,py,js,php,ruby,swift,kotlin,go,rust,scala,perl,ts,jsx,cs,vb,sql,pl,ada,asm,sh,bash,powershell,erl,lua,lisp,matlab,octave,r,fortran,prolog,haskell,ocaml,groovy,julia,perl6,sed,awk,yaml,json,xml
set archiveFormats=iso,rar,tar,7z,zip,gz,bz2,z,tgz,lzh
set webFormats=html,asp,css,xps,jsp,php,aspx,js,ts,jsx,json,xml


echo.
echo 🔸 What do you want to download?
echo 1. Custom file types 🛠️
echo 2. Images only 🖼️
echo 3. Audios only 🎵
echo 4. Videos only 🎥
echo 5. Subtitles only 📝
echo 6. Videos and subtitles 🎥+📝
echo 7. Text files only 📄
echo 8. Programming files only 💻
echo 9. Archive files only 🗄️
echo 10. Web files only 🌐
echo xx. Everything ^(^default^) 🌍
set /p option="> "


if "%option%"=="1" (
	echo.
	echo 🔸 Enter the file extensions to download (comma separated, for example xlsx,ods,s3db,accdb,awdb^) ^:
	set /p extensions="> "
)


:script
echo.
echo.
echo.
echo ^>^>^>^>^> Starting/Resuming Downloads :)

if "%option%"=="1" (
    wget -c -r -np -A %extensions% "%url%"	
) else if "%option%"=="2" (
    wget -c -r -np -A %imageFormats% "%url%"
) else if "%option%"=="3" (
    wget -c -r -np -A %audioFormats% "%url%"
) else if "%option%"=="4" (
    wget -c -r -np -A %videoFormats% "%url%"    
) else if "%option%"=="5" (
    wget -c -r -np -A %subtitleFormats% "%url%"
) else if "%option%"=="6" (
    wget -c -r -np -A %videoFormats%,%subtitleFormats% "%url%"
) else if "%option%"=="7" (
    wget -c -r -np -A %textFormats% "%url%"
) else if "%option%"=="8" (
    wget -c -r -np -A %programmingFormats% "%url%"
) else if "%option%"=="9" (
    wget -c -r -np -A %archiveFormats% "%url%"
) else if "%option%"=="10" (
    wget -c -r -np -A %webFormats% "%url%"
) else (
    wget -c -r -np -A %textFormats%,%programmingFormats%,%archiveFormats%,%webFormats% "%url%"
)


:credits
echo. 
echo. 
echo. 
echo. 
echo 🎉🎉🎉 Hooray! All downloads have been successfully completed!🎉🎉🎉
echo. 
echo. 
echo. 
echo. 
echo 🚀🚀🚀 This awesome script was brought to you by @albertolicea00. 🎈🎈🎈
echo Check out more of his work on GitHub at https://github.com/albertolicea00.
echo.
echo.



:restart
set /p restart="Do you want to download something else [Y/n]."
if /I "%restart%"=="Y" (
    goto url_define
)

echo.
echo.
echo Thanks for use 🙏 ... 
timeout /t 3 /nobreak >nul