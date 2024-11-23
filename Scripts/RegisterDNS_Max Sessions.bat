runas /user:plumber "cmd.exe""
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ipconfig /registerdns
netsh winsock reset
shutdown -r -t 30