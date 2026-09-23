REM documentation
REM https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/route_ws2008
REM https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731521(v=ws.10)

route delete 0.0.0.0
netsh interface ip set address wintun static 172.50.60.70 255.255.255.0 none
timeout /nobreak /t 5
route add 0.0.0.0 mask 0.0.0.0 172.50.60.70
