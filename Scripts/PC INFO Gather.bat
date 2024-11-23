@echo off
Echo PPPPPPPPPPPPPPPPP           CCCCCCCCCCCCC       iiii                      ffffffffffffffff                
Echo P::::::::::::::::P       CCC::::::::::::C      i::::i                    f::::::::::::::::f               
Echo P::::::PPPPPP:::::P    CC:::::::::::::::C       iiii                    f::::::::::::::::::f              
Echo PP:::::P     P:::::P  C:::::CCCCCCCC::::C                               f::::::fffffff:::::f              
Echo   P::::P     P:::::P C:::::C       CCCCCC     iiiiiiinnnn  nnnnnnnn     f:::::f       ffffffooooooooooo   
Echo   P::::P     P:::::PC:::::C                   i:::::in:::nn::::::::nn   f:::::f           oo:::::::::::oo 
Echo   P::::PPPPPP:::::P C:::::C                    i::::in::::::::::::::nn f:::::::ffffff    o:::::::::::::::o
Echo   P:::::::::::::PP  C:::::C                    i::::inn:::::::::::::::nf::::::::::::f    o:::::ooooo:::::o
Echo   P::::PPPPPPPPP    C:::::C                    i::::i  n:::::nnnn:::::nf::::::::::::f    o::::o     o::::o
Echo  P::::P            C:::::C                    i::::i  n::::n    n::::nf:::::::ffffff    o::::o     o::::o
Echo  P::::P            C:::::C                    i::::i  n::::n    n::::n f:::::f          o::::o     o::::o
Echo  P::::P             C:::::C       CCCCCC      i::::i  n::::n    n::::n f:::::f          o::::o     o::::o
Echo PP::::::PP            C:::::CCCCCCCC::::C     i::::::i n::::n    n::::nf:::::::f         o:::::ooooo:::::o
Echo P::::::::P             CC:::::::::::::::C     i::::::i n::::n    n::::nf:::::::f         o:::::::::::::::o
Echo P::::::::P               CCC::::::::::::C     i::::::i n::::n    n::::nf:::::::f          oo:::::::::::oo 
Echo PPPPPPPPPP                  CCCCCCCCCCCCC     iiiiiiii nnnnnn    nnnnnnfffffffff            ooooooooooo  
Echo ------------------------------------------------------------------------------------------------------------
Echo PC name
hostname
Echo .
wmic bios get serialnumber
wmic csproduct get name
wmic path softwarelicensingservice get OA3xOriginalProductKey
Pause