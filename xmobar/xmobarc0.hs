Config { font = "xft:Iosevka Nerd Font:style=Medium:size=10:pixelsize=15:hinting=true"
       , additionalFonts = []
       , borderColor = "black"
       , bgColor = "black"
       , fgColor = "grey"
       , alpha = 100
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
       , commands = [ Run Weather "LPPR" ["-t","<station>: <tempC>C",
                                          "-L","18","-H","25",
                                          "--normal","green",
                                          "--high","red",
                                          "--low","lightblue"] 36000
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run UnsafeStdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "<fc=#666666></fc> %UnsafeStdinReader%}\
                    \{ <fc=#AFAFAF>%date%</fc>| %LPPR%"
       }
