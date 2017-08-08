import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

-- https://wiki.haskell.org/Xmonad/Config_archive/John_Goerzen's_Configuration
-- https://beginners-guide-to-xmonad.readthedocs.io/configure_xmonadhs.html
-- https://unix.stackexchange.com/questions/336701/xmonad-defaults-depreciation-what-is-the-future-proof-configuration
main = do
    xmonad $ def
        -- Simple configruation
        { terminal = "rxvt-unicode"
        , borderWidth = 3
        } `additionalKeys`
        -- Additional keybindings
        [ (( mod1Mask, xK_p ), spawn "dmenu_run -l 10 -fn 'DejaVu Sans Mono-15'" )
        , (( mod1Mask .|. controlMask, xK_l ), spawn "slock" )
        ]
