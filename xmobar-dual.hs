-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- https://github.com/vicfryzel/xmonad-config

-- This xmobar config is for a single 4k display (3840x2160) and meant to be
-- used with the stalonetrayrc-single config.
--
-- If you're using a single display with a different resolution, adjust the
-- position argument below using the given calculation.
Config {
    -- Position xmobar along the top, with a stalonetray in the top right.
    -- Add right padding to xmobar to ensure stalonetray and xmobar don't
    -- overlap. stalonetrayrc-single is configured for 12 icons, each 23px
    -- wide. 
    -- right_padding = num_icons * icon_size
    -- right_padding = 12 * 23 = 276
    -- Example: position = TopP 0 276
    position = Static { xpos = 1920, ypos = 0, width = 1825, height = 19 },
    font = "xft:monospace-14",
    bgColor = "#000000",
    fgColor = "#ffffff",
    lowerOnStart = False,
    overrideRedirect = False,
    allDesktops = False,
    persistent = True,
    commands = [
        Run Weather "EGGD" ["-t","<tempC>C <skyCondition>","-L","10","-H","28","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run MultiCpu ["-t","Cpu: <total0>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        --  Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Network "enp8s0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %R" "date" 10,
        Run Com "getMasterVolume" [] "volumelevel" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %EGGD% | %multicpu% | %memory% | %enp8s0% | <fc=#FFFFCC>%date%</fc>"
    --  template = "%StdinReader% }{ %EGGD% %multicpu%   %memory%   %swap%  %enp8s0%   Vol: <fc=#b2b2ff>%volumelevel%</fc>   <fc=#FFFFCC>%date%</fc>"
}
