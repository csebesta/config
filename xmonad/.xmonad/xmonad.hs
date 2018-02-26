import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Actions.NoBorders

myLayoutHook = smartBorders (layoutHook def)

-- https://wiki.haskell.org/Xmonad/Config_archive/John_Goerzen's_Configuration
-- https://beginners-guide-to-xmonad.readthedocs.io/configure_xmonadhs.html
-- https://unix.stackexchange.com/questions/336701/xmonad-defaults-depreciation-what-is-the-future-proof-configuration
main = xmonad $ def

    -- Simple configruation
    { terminal = "rxvt-unicode"
    , borderWidth = 3
    , layoutHook = myLayoutHook
    } `additionalKeys`

    -- Additional keybindings
    [ (( mod1Mask, xK_p ), spawn "dmenu_run \
    \ -l 10 \
    \ -fn 'DejaVu Sans Mono-15' \
    \ -sb '#073642' \
    \ -nb '#002b36'" )
    , (( mod1Mask, xK_e ), spawn "nautilus --no-desktop" )
    , (( mod1Mask, xK_b ), withFocused toggleBorder ) -- Toggle borders
    , (( mod1Mask, 0x2d ), spawn "amixer -q sset Master 5%-" ) -- Lower volume
    , (( mod1Mask, 0x3d ), spawn "amixer -q sset Master 5%+" ) -- Raise volume
    , (( mod1Mask, xK_BackSpace ), spawn "amixer -D pulse set Master toggle" ) -- Mute and unmute
    , (( mod1Mask .|. controlMask, xK_l ), spawn "slock" ) -- Lock screen
    ]
