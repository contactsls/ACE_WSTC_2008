@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set BuildFileDir="C:\MessageBrokerFiles\Scripts\AntScriptsRoot2\BrokerDomain\ConfigMgr\Broker\ExecutionGroup\BarFile\build.xml"



for /f %%a in (Project.list) do call :MY_SUB %%a
GOTO SUB_DONE


:MY_SUB
set project.name=%1
echo %project.name%
rem echo %BuildFileDir%\build.xml
call ant -f "C:\MessageBrokerFiles\Scripts\AntScriptsRoot2\BrokerDomain\ConfigMgr\Broker\ExecutionGroup\BarFile\build.xml"
GOTO :EOF


:SUB_DONE

ENDLOCAL
