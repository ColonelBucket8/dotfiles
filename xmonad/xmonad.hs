import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.EZConfig (additionalKeys,removeKeys)
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutModifier(ModifiedLayout)
import XMonad.Actions.UpdatePointer

-- The main function
main :: IO ()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ myConfig

-- Command to launch the bar
myBar = "xmobar"

myPP = xmobarPP 
    { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

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
myLayout = avoidStruts $ mySmartSpacing $ layoutTall ||| (noBorders layoutFull)
    where
        myGap = spacingRaw False (Border 10 0 10 0) True (Border 0 10 0 10) True
        mySmartSpacing = smartSpacing 5
        layoutTall = Tall 1 (3/100) (1/2)
        layoutFull = Full

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

-- Autostart programs
myStartupHook = do
    spawn "feh --bg-scale ~/Pictures/Wallpapers/anime-4.jpg"
    spawn "picom --experimental-backends"
    spawn "fcitx5"
    spawn "nm-applet"
    -- spawn "xrandr --output DVI-D-0 --mode 1920x1080 --rate 120.00 --auto --left-of HDMI-0 --output HDMI-0"
    spawn "xautolock -detectsleep -time 10 -locker 'i3lock -c 000000'"
    -- Lockscreen with background image, png only
    -- spawn "xautolock -detectsleep -time 10 -locker 'i3lock -i ~/Pictures/Wallpapers/jabami-yumeko.png"
    spawn "xmobar -x 1 ~/.xmobarrc"
    -- System tray
    -- spawn "stalonetray"
