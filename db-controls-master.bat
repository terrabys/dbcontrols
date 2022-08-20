@echo off
COLOR 0A

call :checkIfAdmin

set sqlSrvName=
set pgSqlSrvName=
set mongoDbSrvName=
set pathToWorkbench=""
set pathToPgAdmin=""
set pathToMonDbCompass=""

call :checkSrvStatus

:menu
cls
echo.
echo -----------------------------------------
echo ^| Wellcome to my DB servers controls    ^|
echo ^| MySQL Service Status: %sqlStatus%         ^|
echo ^| PostgresSQL Service Status: %pgSqlStatus%    ^|
echo ^| MongoDB Service Status: %monDbStatus%       ^|
echo -----------------------------------------
echo.
echo 1. Start MySQL service.
echo 2. Start PostgreSQL service.
echo 3. Start MongoDB service.
echo 4. Stop MySQL service.
echo 5. Stop PostgreSQL service.
echo 6. Stop MongoDB service.
echo 7. Start MySQL Workbench.
echo 8. Start pgAdmin4.
echo 9. Start MongoDB Compass.
echo.
echo 0. Exit
echo.
set /p answ=Enter your choice: 

if #%answ%# == ## goto menu

if %answ% == 1 (
	sc start %sqlSrvName% > nul
	timeout 5
)
if %answ% == 2 (
	sc start %pgSqlSrvName% > nul
	timeout 5
)
if %answ% == 3 (
	sc start %mongoDbSrvName% > nul
	timeout 5
)
if %answ% == 4 sc stop %sqlSrvName% > nul
if %answ% == 5 sc stop %pgSqlSrvName% > nul
if %answ% == 6 sc stop %mongoDbSrvName% > nul
if %answ% == 7 start "" %pathToWorkbench%
if %answ% == 8 start "" %pathToPgAdmin%
if %answ% == 9 start "" %pathToMonDbCompass%
if %answ% == 0 goto exit
call :checkSrvStatus
set answ=
goto menu


pause


:checkSrvStatus
sc query %sqlSrvName% | find "RUNNING" > nul
if %errorlevel% == 0 ( 
	set sqlStatus=Running
) else (
	set sqlStatus=Stopped
)
sc query %pgSqlSrvName% | find "RUNNING" > nul
if %errorlevel% == 0 ( 
	set pgSqlStatus=Running
) else (
	set pgSqlStatus=Stopped
)
sc query %mongoDbSrvName% | find "RUNNING" > nul
if %errorlevel% == 0 ( 
	set monDbStatus=Running
) else (
	set monDbStatus=Stopped
)
goto :eof

:checkIfAdmin
openfiles >nul 2>&1
if %errorlevel% == 1 (
	echo You are not Administrator
	echo.
	echo Re-run this script as Administrator.
	echo.
	echo Exiting...
	ping 127.0.0.1 > nul 5>&1
	goto exit
)
goto :eof

:exit
exit