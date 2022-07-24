import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.EwmhDesktops

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
    -- , layoutHook  = myLayout
    , focusFollowsMouse = myFocusFollowsMouse
    }

myTerminal :: String
myTerminal = "alacritty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myBorderWidth :: Dimension
myBorderWidth = 2

myModMask = mod4Mask
-- myLayout = spacingRaw False (Border 10 0 10 0) True (Border 0 10 0 10) True $ Tall (1 (3/100) (1/2)) ||| Full
