@echo off

title Pesquisa Rapida 2.0 - Por: lucas.assuncao - Locaweb
mode 100,10

color f0

For /F "tokens=1,2,3 delims=/ " %%A in ('Date /t') do @(
    Set dia=%%A
    Set mes=%%B
    Set ano=%%C
)

IF NOT EXIST %userprofile%\Desktop\Relatorios2 (mkdir %userprofile%\Desktop\Relatorios2)
IF NOT EXIST %userprofile%\Desktop\Relatorios2\%dia%%mes%%ano% (mkdir %userprofile%\Desktop\Relatorios2\%dia%%mes%%ano%)

start /min whois.exe
IF EXIST whois.exe (GOTO hello) ELSE (GOTO bye)

:hello

cls
set /p d="Digite o Dominio ou aperte 's' para sair: "
if %d% equ s goto bye

nslookup -q=ns %d% 8.8.8.8 > %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo ################################################# >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt

nslookup -q=mx %d% 8.8.8.8 >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo ################################################# >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt

nslookup -q=txt %d% 8.8.8.8 >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo ################################################# >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt

whois %d% >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo ################################################# >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt

REM echo Defina o numero de saltos do ping: 
REM set /p p= > nul

ping -n 1 webmail.%d% >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo ################################################# >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
echo. >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt

echo Pesquisa feita em: >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt
powershell Get-Date >> %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt


start U:\Ferramentas\SublimeText3\sublime_text.exe %userprofile%/Desktop/Relatorios2/%dia%%mes%%ano%/%d%.txt

set /p c="Deseja pesquisar outro dominio ? (s/n): "
IF "%c%"=="s" (goto hello
) ELSE (
REM goto bye
)

:bye
pause