import System.IO
import XMonad
import XMonad.Actions.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Run (spawnPipe)

------------------------------------------------------------------------
-- Status bar (Pretty Printing)
-- https://github.com/dmxt/Solarized-xmonad-xmobar
myBar = "xmobar"
myPP = xmobarPP
	{  ppTitle = xmobarColor "#657b83" "" . shorten 100
    , ppCurrent = xmobarColor "#c0c0c0" "" . wrap "" ""
	, ppSep = xmobarColor "#c0c0c0" "" " | "
    , ppUrgent = xmobarColor "#ff69b4" ""
	, ppLayout = const "" -- Disables layout info
	}

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

------------------------------------------------------------------------
-- Colors and borders
myNormalBorderColor = "#002b36"
myFocusedBorderColor = "#657b83"

------------------------------------------------------------------------
-- Keybindings
myKeys =

    [ (( mod1Mask, xK_p ), spawn "dmenu_run \
    \ -l 10 \
    \ -fn 'DejaVu Sans Mono-15' \
    \ -sb '#073642' \
    \ -nb '#002b36'" )
    , (( mod1Mask, xK_e ), spawn "nautilus --no-desktop" )
    , (( mod1Mask, 0x2d ), spawn "amixer -q sset Master 5%-" ) -- Lower volume
    , (( mod1Mask, 0x3d ), spawn "amixer -q sset Master 5%+" ) -- Raise volume
    , (( mod1Mask, xK_BackSpace ), spawn "amixer -D pulse set Master toggle" ) -- Mute and unmute
    , (( mod1Mask .|. controlMask, xK_l ), spawn "slock" ) -- Lock screen
    ]

------------------------------------------------------------------------
-- Main function
-- https://beginners-guide-to-xmonad.readthedocs.io/configure_xmonadhs.html
-- https://unix.stackexchange.com/questions/336701/xmonad-defaults-depreciation-what-is-the-future-proof-configuration
-- https://wiki.haskell.org/Xmonad/Config_archive/John_Goerzen's_Configuration
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

------------------------------------------------------------------------
-- Main configuration
myConfig = def
    { manageHook = manageDocks <+> manageHook def
    , layoutHook = smartBorders $ avoidStruts $ layoutHook def
	, terminal = "rxvt-unicode"
    , borderWidth = 1
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    } `additionalKeys` myKeys
