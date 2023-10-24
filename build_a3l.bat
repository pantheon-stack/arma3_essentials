@echo off
SETLOCAL
echo Building on %cd%
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

rem increasing build number
FOR /R .\addons %%g IN (*version.hpp) do (
	echo "== %%g"
	SETLOCAL ENABLEDELAYEDEXPANSION
	(
		FOR /F "tokens=1,2,3* delims= " %%i IN (%%g) DO (
			IF "%%j" == "BUILD" (
				set _build=%%k
				set /a _build=_build+1
				echo %%i %%j !_build!
			) ELSE (
				echo %%i %%j %%k
			)
		)
	) > "%%g.temp"
	echo "Current Build Version is !_build!"
	ENDLOCAL
	del "%%g.old"
	ren "%%g" "%%~nxg.old"
	ren "%%g.temp" "%%~nxg"
)
hemtt build -v
:END
ENDLOCAL
