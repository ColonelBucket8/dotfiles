import XMonad

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.WindowSwallowing

import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutModifier(ModifiedLayout)

import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeys,removeKeys)

import XMonad.Actions.UpdatePointer

-- The main function
main :: IO ()
main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig

-- Command to launch the bar
myBar = "xmobar"

myXmobarPP :: PP
myXmobarPP = def 
    { ppSep             = magenta " | "
    , ppVisible         = white . xmobarBorder "Top" "#ff5555" 2
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap "|" "|" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    -- , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where 
    formatFocused   = wrap (white    "[") (white    "]") . green . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue . ppWindow


    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow, green, darkblue :: String -> String
    -- xmobarColor :: String foregound color
    --             -> String background color
    --             -> String output string
    --             -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    darkblue = xmobarColor "#090ece" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
    green    = xmobarColor "#00ff00" ""
-- toggleStrutsKey XConfig {XMonad.modMask = modMask} = {modMask, xK_b}

myConfig = def
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , layoutHook  = myLayout
    , focusFollowsMouse = myFocusFollowsMouse
    , startupHook = myStartupHook
    , logHook     = myLogHook
    , manageHook  = myManageHook
    , handleEventHook = myHandleEventHook
    } `removeKeys` myRemoveKeys `additionalKeys` myKeys

myTerminal :: String
myTerminal = "alacritty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myBorderWidth :: Dimension
myBorderWidth = 2

-- Mod key to Win key
myModMask = mod4Mask

-- Add gaps
myLayout = avoidStruts $ myGap $ layoutTall ||| layoutFull
    where
        myGap = spacingRaw False (Border 5 0 5 0) True (Border 0 5 0 5) True
        mySpacing = spacing 5
        mySmartSpacing = smartSpacing 5
        layoutTall = renamed [Replace "Tall"] $ spacing 3 $ Tall 1 (3/100) (1/2)
        layoutFull = noBorders Full

-- Remove default keybinding
myRemoveKeys = 
 [ ((myModMask .|. shiftMask, xK_Return))]

-- Custom keybinding
myKeys =
 [ ((myModMask, xK_Return), spawn "alacritty")
 , ((myModMask, xK_p), spawn "rofi -show drun -show-icons")
--  , ((myModMask .|. shiftMask, xK_Return), spawn "steam")
 , ((myModMask, xK_BackSpace), spawn "i3lock -c 000000")
 , ((myModMask, xK_f), sendMessage ToggleStruts)
 ]

-- Cursor follows focus window
myLogHook = updatePointer (0.5, 0.5) (0, 0)

myManageHook = manageHook def <+> manageDocks

-- Window Swallowing
myHandleEventHook = swallowEventHook (className =? "Alacritty" <||> className =? "XTerm") (return True)

-- Autostart programs
myStartupHook = do
    spawnOnce "xrandr --output DVI-D-0 --mode 1920x1080 --rate 120.00 --auto --left-of HDMI-0 --output HDMI-0"
    spawnOnce "xautolock -detectsleep -time 10 -locker 'i3lock -c 000000'"
    spawnOnce "conky"
    spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --transparent true --width 6 --height 22 --tint 0x000000 --expand true"
    spawn "feh --bg-scale ~/Pictures/Wallpapers/anime-4.jpg"
    spawn "picom --experimental-backends"
    spawn "fcitx5"
    spawn "nm-applet"
    -- Lockscreen with background image, png only
    -- spawn "xautolock -detectsleep -time 10 -locker 'i3lock -i ~/Pictures/Wallpapers/jabami-yumeko.png"
    spawn "xmobar -x 1 ~/.xmobarrc1"
    -- spawn "conky"
    -- System tray
    -- spawn "stalonetray"
