import XMonad

main = xmonad def
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , layoutHook  = myLayout
    , focusFollowsMouse = myFocusFollowsMouse
    }

myTerminal :: String
myTerminal = "alacritty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = true

myBorderWidth :: Int
myBorderWidth = 3

myModMask = mod4Mask
myLayout = spacingRaw False (Border 10 0 10 0) True (Border 0 10 0 10) True $ Tall (1 (3/100) (1/2)) ||| Full
