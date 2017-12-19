@echo off 
TITLE YOU ARE WELCOME %USERNAME% a SysVd v1

MODE con:cols=80 lines=40
color a
:inicio
SET var=0
SET ip_user
SET red_wifi
SET ip_puerto1
SET ip_puerto2
SET ip_fing
cls
echo ################################################################################
echo  %DATE% ^| %TIME%
echo -# COLLABORATOR      : Jorge Enrique Lopez = El Plex
echo -# AUTHOR            : DaveNISC 2017 
echo -#
echo -# Software link     : https://github.com/davenisc 
echo -# Version           : 1
echo -# Tested on         : Windows 7, 8, 8.1, 10 (x86 - x64)
echo -# Description       : BASIC SCRIPT TO AUTOMATE SECURITY TEST
echo -# CONTACT MAIL      : sysvd@protonmail.com
echo - TOOLS
echo - https://nmap.org/
echo - https://github.com/AlessandroZ/LaZagne
echo - https://www.fing.io/  
echo ################################################################################
echo - 
echo 1 VIEW WIFI PASSWORDS STORED
echo 2 NETWORK ANALYSIS
echo 3 SEE ALL STORED PASSWORDS
echo 4 WHAT IS MY PUBLIC IP?
echo 5 SPECIFIC SEARCH FOR PORTS
echo 6 NETWORK ANALYSIS WITH FING
echo 7 SALIR
echo. 

SET /p var= ^> SELECT AN OPTION [1-7]:

if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto op5
if "%var%"=="6" goto op6
if "%var%"=="7" goto salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. THE NUMBER "%var%"  IS NOT A VALID OPTION PLEASE TRY AGAIN
echo.
pause
echo.
goto:inicio

:op1
    echo.
    echo. HAVE THE OPTION # 1
    echo.
        ::Aquí van las líneas de comando de tu opción
        echo - LOOKING FOR STORED WI-FI NETWORKS
        netsh wlan show profile
        echo -
        echo ################################################################################
        SET /p red_wifi= CHOOSE A WI-FI NETWORK AND WRITE TO CONTINIATION
        echo -NOTE: THE TEXT TO ENTER MUST BE EQUAL TO HOW IT APPEARS IN THE CONSOLE, WITHOUT OMITTING CAPS, MINUSCLES, SPACES, ETC.
        @ECHO.
        echo ################################################################################
        netsh wlan show profile name=%red_wifi% key=clear > C:\SysVd1\Results\password_Wi-Fi.txt
        echo -THE RESULTS HAVE BEEN SAVED IN A TXT IN C:\SysVd1\Resultados\ WITH NAME password_Wi-Fi.txt
        echo ################################################################################
    echo.
    pause
    goto:inicio

:op2
    echo.
    echo. HAVE THE OPTION # 2
    echo.
        ::Aquí van las líneas de comando de tu opción
        echo - ANALYSIS OF NODES IN THE NETWORK OF %USERNAME%
        ipconfig
        echo -
        echo ################################################################################
        @ECHO.
        echo WHAT IS YOUR ETHERNET IP?
        SET /p ip_user= 
        @ECHO.

        msg * "THIS PROCESS CAN TAKE A FEW MINUTES, PLEASE WAIT, WE WILL WARN YOU HOW MUCH" 
        cd C:\SysVd1\Nmap
        nmap.exe -O -sS %ip_user%,1-254 > C:\SysVd1\Results\network_scan.txt
        msg * "THE FINALIZED ANALYSIS" 
        echo -THE RESULTS HAVE BEEN SAVED IN A TXT IN C:\SysVd1\Results\ WITH NAME network_scan.txt 
        echo ################################################################################
    echo.
    pause
    goto:inicio

:op3
    echo.
    echo. HAVE THE OPTION # 3
    echo.
        ::A
               cd C:\SysVd1\lazagne\Windows
               msg * "THIS PROCESS CAN TAKE A FEW MINUTES, PLEASE WAIT, WE WILL WARN YOU HOW MUCH"
               laZagne.exe browsers > C:\SysVd1\Results\password_browsers.txt
               msg * "THE FINALIZED ANALYSIS" 
        echo -THE RESULTS HAVE BEEN SAVED IN A TXT IN C:\SysVd1\Results\ WITH NAME password_browsers.txt 
        echo ################################################################################
    echo.         
    pause
    goto:inicio
   
:op4
    echo.
    echo. HAVE THE OPTION # 4
    echo.
        ::Aquí van las líneas de comando de tu opción 
        ::conocer direccion IP publica del equipo---------->
        echo ################################################################################
        echo - STARTING PROCESS .......
        msg * "THIS PROCESS CAN TAKE A FEW MINUTES, PLEASE WAIT, WE WILL WARN YOU HOW MUCH"
        echo open>login.txt
        echo ftp.opera.com>>login.txt
        echo anonymous>>login.txt
        echo.>>login.txt
        echo literal stat>>login.txt
        echo close>>login.txt
        echo quit>>login.txt
        ftp -s:login.txt>>"elip.txt"
        del login.txt
        for /F "tokens=*" %%a in (elip.txt) do ( echo."%%a"|findstr /C:"Connected to" >> info.txt )
        del elip.txt
        for /F "tokens=*" %%e in (info.txt) do (
            echo %%~e > info.txt
            )
        for /F "tokens=3 delims= " %%i in (info.txt) do (
            echo.
            echo Tu IP publica es %%i
            msg * "THE FINALIZED ANALYSIS"
            echo ################################################################################
            )
        del info.txt
    echo.
    pause
    goto:inicio

:op5
    echo.
    echo. HAVE THE OPTION # 5
    echo.
        ::Aquí van las líneas de comando de tu opción
        :: ---------------------------->
        echo -
        echo ################################################################################
        @ECHO.
        echo ENTER THE IP OR URL TO BE ANALYZED
        SET /p ip_puerto= 
        @ECHO.
        msg * "THIS PROCESS CAN TAKE A FEW MINUTES, PLEASE WAIT, WE WILL WARN YOU HOW MUCH" 
        cd C:\SysVd1\Nmap
        nmap.exe -sS %ip_puerto1% > C:\SysVd1\Results\port_scanning.txt
        msg * "THE FINALIZED ANALYSIS" 
        echo -THE RESULTS HAVE BEEN SAVED IN A TXT IN C:\SysVd1\Results\ WITH NAME port_scanning.txt
        echo ################################################################################
    echo.
    pause
    goto:inicio

    :op6
    echo.
    echo. HAVE THE OPTION # 6
    echo.
        ::Aquí van las líneas de comando de tu opción 
        ::---------->
       echo -HELLO! %USERNAME% WHAT DO YOU WANT TO ANALYZE TODAY? 
        echo ################################################################################
        @ECHO.
        echo ENTER THE URL OR IP TO ANALYZE
        SET /p ip_fing= 
        @ECHO.
        msg * "THIS PROCESS CAN TAKE A FEW MINUTES, PLEASE WAIT, WE WILL WARN YOU HOW MUCH" 
        cd C:\SysVd1\fing\Overlook_Fing\bin
        fing.exe -s %ip_fing% > C:\SysVd1\Results\network_scan.txt
        msg * "THE FINALIZED ANALYSIS" 
        echo -THE RESULTS HAVE BEEN SAVED IN A TXT IN C:\SysVd1\Results\ WITH NAME network_scan.txt 
        echo ################################################################################
    echo.
    pause
    goto:inicio

:salir
    @cls&exit
