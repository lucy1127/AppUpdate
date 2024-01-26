@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM The location of the new JAR file
SET NEW_JAR_URL=https://example.com/demo-0.0.2-SNAPSHOT.jar
SET JAR_NAME=demo-0.0.2-SNAPSHOT.jar

REM Use the {app} constant to refer to the installation directory
SET APP_DIR=%~dp0

REM Download the new JAR file using curl or another download utility
curl -o "!APP_DIR!\!JAR_NAME!" "%NEW_JAR_URL%"

REM Update the XML file with the new JAR name
powershell -Command "(Get-Content '!APP_DIR!\springbootDemo.xml').replace('demo-0.0.1-SNAPSHOT.jar', '!JAR_NAME!') | Set-Content '!APP_DIR!\springbootDemo.xml'"

echo Update complete.
