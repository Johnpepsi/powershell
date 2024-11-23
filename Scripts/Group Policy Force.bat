@echo off
ECHO ###############################################################################
ECHO #                    THIS WILL UPDATE YOUR GROUP POLICY                       #
ECHO ###############################################################################
cd/
gpupdate /force
shutdown -r -t 60

pause