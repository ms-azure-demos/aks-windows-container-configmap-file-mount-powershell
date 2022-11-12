#FROM mcr.microsoft.com/windows/servercore:ltsc2019 as runtime
FROM mcr.microsoft.com/powershell:lts-7.2-nanoserver-1809 as runtime
WORKDIR c:\\app
COPY program.ps1 .
COPY appsettings.json .

ENTRYPOINT [ "pwsh","-File","./program.ps1" ]