@echo off

REM use visual studio command line prompt run this batch file

pushd "%~dp0"

REM compile
cmake -DCMAKE_INSTALL_PREFIX="C:\Program Files\PostgreSQL\16" -DCMAKE_GENERATOR_PLATFORM=x64 -B build
MSBuild build/ip4r.sln /property:Configuration=Debug /property:Platform=x64
MSBuild build/ip4r.sln /property:Configuration=Release /property:Platform=x64

REM copy files
@echo.
@echo Copy ip4r.dll to .\output\lib\
xcopy /y build\Release\ip4r.dll .\output\lib\

@echo.
@echo Copy ip4r.control to .\output\share\extension\
xcopy /y ip4r.control .\output\share\extension\

@echo.
@echo Copy ip4r--2.0--2.1.sql to .\output\share\extension\
xcopy /y scripts\ip4r--2.0--2.1.sql .\output\share\extension\

@echo.
@echo Copy ip4r--2.1--2.2.sql to .\output\share\extension\
xcopy /y scripts\ip4r--2.1--2.2.sql .\output\share\extension\

@echo.
@echo Copy ip4r--2.2--2.4.sql to .\output\share\extension\
xcopy /y scripts\ip4r--2.2--2.4.sql .\output\share\extension\

@echo.
@echo Copy ip4r--2.4.sql to .\output\share\extension\
xcopy /y scripts\ip4r--2.4.sql .\output\share\extension\

goto END

:INVALID_VS_ENV
echo Incorrect Visual Studio version. You must use Visual Studio 2015 or 2017 Developer Command Prompt.
exit /b 1

:END