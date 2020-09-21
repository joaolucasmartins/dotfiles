--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import Data.Monoid
import System.Exit
import Data.Maybe (isJust)

import XMonad.Util.Run(spawnPipe, hPutStrLn)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders(noBorders)

-- Pywal
import Custom.Colors

-- Polybar Integration
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

-- Topbar
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.DwmStyle
import XMonad.Layout.Decoration

-- Promote
import XMonad.Actions.Promote

-- Push all to tiling
import XMonad.Actions.WithAll (sinkAll)

-- Opacity
import XMonad.Hooks.FadeInactive

-- Mouse Reszie
import XMonad.Actions.MouseResize

-- Comment
import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), nextScreen, prevScreen)

-- Toggle
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import XMonad.Layout.MultiToggle (EOT(EOT), (??), mkToggle)
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))
-- Hotkeys
import XMonad.Util.EZConfig (additionalKeysP)

-- Layouts
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Magnifier
import XMonad.Layout.Tabbed
-- Layout Modifiers
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
  -- Spacing
import XMonad.Layout.LayoutModifier -- usado para modificar layouts existentes. Ex adicionar spacing
import XMonad.Layout.Spacing

import XMonad.Util.NamedScratchpad

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "alacritty"
myFont          = "xft:Mononoki Nerd Font:regular:pixelsize=11"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 10

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["\61728", "\61729", "\62057", "\58875", "\61574", "\61444", "\62211", "\62605", "\61598"]
-- windowCount :: X (Maybe String)
-- windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = color0
myFocusedBorderColor = color1

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
--myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
--
--    -- launch a terminal
--    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
--
--    -- launch dmenu
--    , ((modm,               xK_p     ), spawn "dmenu_run")
--
--    -- launch gmrun
--    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
--
--    -- close focused window
--    , ((modm .|. shiftMask, xK_c     ), kill)
--
--     -- Rotate through the available layout algorithms
--    , ((modm,               xK_space ), sendMessage NextLayout)
--
--    --  Reset the layouts on the current workspace to default
--    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
--
--    -- Resize viewed windows to the correct size
--    , ((modm,               xK_n     ), refresh)
--
--    -- Move focus to the next window
--    , ((modm,               xK_Tab   ), windows W.focusDown)
--
--    -- Move focus to the next window
--    , ((modm,               xK_j     ), windows W.focusDown)
--
--    -- Move focus to the previous window
--    , ((modm,               xK_k     ), windows W.focusUp  )
--
--    -- Move focus to the master window
--    , ((modm,               xK_m     ), windows W.focusMaster  )
--
--    -- Swap the focused window and the master window
--    , ((modm,               xK_Return), windows W.swapMaster)
--
--    -- Swap the focused window with the next window
--    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
--
--    -- Swap the focused window with the previous window
--    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
--
--    -- Shrink the master area
--    , ((modm,               xK_h     ), sendMessage Shrink)
--
--    -- Expand the master area
--    , ((modm,               xK_l     ), sendMessage Expand)
--
--    -- Push window back into tiling
--    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
--
--    -- Increment the number of windows in the master area
--    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
--
--    -- Deincrement the number of windows in the master area
--    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
--
--    -- Toggle the status bar gap
--    -- Use this binding with avoidStruts from Hooks.ManageDocks.
--    -- See also the statusBar function from Hooks.DynamicLog.
--    --
--    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
--
--    -- Quit xmonad
--    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
--
--    -- Restart xmonad
--    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
--    , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5%")
--    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5%")
--
--    -- Run xmessage with a summary of the default keybindings (useful for beginners)
--    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
--    ]
--    ++
--
--    --
--    -- mod-[1..9], Switch to workspace N
--    -- mod-shift-[1..9], Move client to workspace N
--    --
--    [((m .|. modm, k), windows $ f i)
--        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
--        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
--    ++
--
--    --
--    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
--    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
--    --
--    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
--        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
--        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
--
--
--------------------------------------------------------------------------
---- Mouse bindings: default actions bound to mouse events
----
--myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
--
--    -- mod-button1, Set the window to floating mode and move by dragging
--    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
--                                       >> windows W.shiftMaster))
--
--    -- mod-button2, Raise the window to the top of the stack
--    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
--
--    -- mod-button3, Set the window to floating mode and resize by dragging
--    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
--                                       >> windows W.shiftMaster))
--
--    -- you may also bind events to the mouse scroll wheel (button4 and button5)
--    ]

------------------------------------------------------------------------
--Scratchpacks
myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                ]
  where
    spawnTerm  = myTerminal ++ " -n scratchpad"
    findTerm   = resource =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
------------------------------------------------------------------------
-- Layouts:

-- Spacing Independente de num de windows
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Spacing menos qd 1 janela
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

spaaaaace = 50

tall     = renamed [Replace "tall"] 
           $ mySpacing spaaaaace
           $ ResizableTall 1 (3/100) (1/2) []

floats   = renamed [Replace "floats"]
           simplestFloat

monocle  = renamed [Replace "monocle"]
           Full

magnify  = renamed [Replace "magnify"]
           $ magnifier
           $ mySpacing spaaaaace
           $ ResizableTall 1 (3/100) (1/2) []

tabs     = renamed [Replace "tabs"]
           -- I cannot add spacing to this layout because it will
           -- -- add spacing between window and tabs which looks bad.
           $ tabbed shrinkText myTabConfig
           where
	   myTabConfig = def { fontName            = myFont
                             , activeColor         = "#292d3e"
                             , inactiveColor       = "#3e445e"
                             , activeBorderColor   = "#292d3e"
                             , inactiveBorderColor = "#292d3e"
                             , activeTextColor     = "#ffffff"
                             , inactiveTextColor   = "#d0d0d0"
                             }


myLayout = avoidStruts $ mouseResize $ windowArrange $ T.toggleLayouts floats $
    mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
        where
            myDefaultLayout = tall
                ||| magnify
                ||| noBorders monocle
                ||| floats
                -- ||| grid
                ||| noBorders tabs
                -- -- ||| spirals
                -- -- ||| threeCol
                -- -- ||| threeRow


------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    ] <+> namedScratchpadManageHook myScratchPads

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook dbus = def
    { ppOutput = dbusOutput dbus
    , ppCurrent = wrap ("%{F" ++ color7 ++ "} ") " %{F-}"
    , ppVisible = wrap ("%{F" ++ color1 ++ "} ") " %{F-}"
    , ppUrgent = wrap ("%{F" ++ red ++ "} ") " %{F-}"
    , ppHidden = wrap ("%{F" ++ color1 ++ "} ") " %{F-}"
    , ppHiddenNoWindows = wrap ("%{F" ++ gray ++ "} ") " %{F-}"
    , ppTitle = wrap ("%{F" ++ color6 ++ "} ") " %{F-}" . shorten 73
    }

dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = return ()
    -- spawn "killall polybar ; polybar config"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
        dbus <- D.connectSession
        D.requestName dbus (D.busName_ "org.xmonad.Log")
            [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

        xmonad $ docks $ defaults dbus

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults h = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        -- keys               = myKeys,
        -- mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = dynamicLogWithPP (myLogHook h),
        startupHook        = myStartupHook
    } `additionalKeysP` myKeys

myKeys :: [(String, X ())]
myKeys =
    -- Xmonad
        [ ("M-q", spawn "xmonad --restart")        -- Restarts xmonad
        , ("M-S-q", io exitSuccess)                  -- Quits xmonad

    -- Open my preferred terminal
        , ("M-S-<Return>", spawn myTerminal)

    -- Floating windows
        , ("M-t", withFocused $ windows . W.sink) -- Push floating window back to tile
        , ("M-S-t", sinkAll)                      -- Push ALL floating windows to tile

    -- Windows navigation
        , ("M-m", windows W.focusMaster)     -- Move focus to the master window
        , ("M-j", windows W.focusDown)       -- Move focus to the next window
        , ("M-k", windows W.focusUp)         -- Move focus to the prev window
        , ("M-S-j", windows W.swapDown)      -- Swap focused window with next window
        , ("M-S-k", windows W.swapUp)        -- Swap focused window with prev window
        , ("M-<Return>", promote)         -- Moves focused window to master, others maintain order
--        , ("M-S-s", windows copyToAll)
--        , ("M-C-s", killAllOtherCopies)

        -- Layouts
        , ("M-<Tab>", sendMessage NextLayout)                -- Switch to next layout
        , ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts) -- Toggles noborder/full

        , ("M-b", sendMessage (MT.Toggle NOBORDERS)) -- Toggles BORD
        , ("M-<KP_Multiply>", sendMessage (IncMasterN 1))   -- Increase number of clients in master pane
        , ("M-<KP_Divide>", sendMessage (IncMasterN (-1)))  -- Decrease number of clients in master pane

        , ("M-h", sendMessage Shrink)                       -- Shrink horiz window width
        , ("M-l", sendMessage Expand)                       -- Expand horiz window width
        , ("M-C-j", sendMessage MirrorShrink)               -- Shrink vert window width
        , ("M-C-k", sendMessage MirrorExpand)               -- Exoand vert window width

        , ("M-+", incWindowSpacing 5)               -- Exoand vert window width
        , ("M--", decWindowSpacing 5)               -- Exoand vert window width

    -- Workspaces
        , ("M-.", nextScreen)  -- Switch focus to next monitor
        , ("M-,", prevScreen)  -- Switch focus to prev monitor

    -- Scratchpads
        , ("M-C-<Return>", namedScratchpadAction myScratchPads "terminal")

    -- Search
        , ("M-s" , spawn "~/.local/bin/dmenu_websearch")

    --- My Applications (Super+Alt+Key)
    --    , ("M-M1-a", spawn (myTerminal ++ " -e ncpamixer"))
    --    , ("M-M1-b", spawn "surf www.youtube.com/c/DistroTube/")
    --    , ("M-M1-e", spawn (myTerminal ++ " -e neomutt"))
    --    , ("M-M1-f", spawn (myTerminal ++ " -e sh ./.config/vifm/scripts/vifmrun"))
    --    , ("M-M1-i", spawn (myTerminal ++ " -e irssi"))
    --    , ("M-M1-j", spawn (myTerminal ++ " -e joplin"))
    --    , ("M-M1-l", spawn (myTerminal ++ " -e lynx https://distrotube.com"))
    --    , ("M-M1-m", spawn (myTerminal ++ " -e mocp"))
    --    , ("M-M1-n", spawn (myTerminal ++ " -e newsboat"))
    --    , ("M-M1-p", spawn (myTerminal ++ " -e pianobar"))
    --    , ("M-M1-r", spawn (myTerminal ++ " -e rtv"))
    --    , ("M-M1-t", spawn (myTerminal ++ " -e toot curses"))
    --    , ("M-M1-w", spawn (myTerminal ++ " -e wopr report.xml"))
    --    , ("M-M1-y", spawn (myTerminal ++ " -e youtube-viewer"))

    -- Multimedia Keys
        , ("<XF86AudioMute>",   spawn "pamixer -t")  -- Bug prevents it from toggling correctly in 12.04.
        , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5")
        , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")
        , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
        , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
        , ("<Print>", spawn "escrotum -C")
        , ("M-<Print>", spawn "escrotum -Cs")

        ]

        -- The following lines are needed for named scratchpads.
          where nonNSP          = WSIs (return (\ws -> W.tag ws /= "nsp"))
                nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "nsp"))
