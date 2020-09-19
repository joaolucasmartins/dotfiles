Config { font = "xft:Iosevka Nerd Font:style=Medium:size=10:pixelsize=15:hinting=true"
       , additionalFonts = []
       , borderColor = "black"
       , bgColor = "black"
       , fgColor = "grey"
       , alpha = 50
       , position = Top
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run Network "enp3s0" ["-L","0","-H","32",
                                          "--normal","green","--high","red"] 10
                    , Run Network "wlp2s0" ["-L","0","-H","32",
                                          "--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50",
                               "--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Swap [] 10
                    , Run UnsafeStdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "<fc=#666666></fc> %UnsafeStdinReader%}\
                    \{%cpu% | %memory% * %swap% | %enp3s0%   %wlp2s0% | "
       }
