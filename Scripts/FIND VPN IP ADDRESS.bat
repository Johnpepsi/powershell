@ECHO OFF
ECHO ###############################################################################
ECHO # We are looking for a IPv4 address. It will be 10.51.112.*** or 10.254.8.*** #
ECHO #                                                                             #
ECHO #                    WE WILL NEED THE FULL IP ADDRESS                         #
ECHO ###############################################################################
ipconfig /all | find /i "IPv4"
PAUSE

