import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

-- https://wiki.haskell.org/Xmonad/Config_archive/John_Goerzen's_Configuration
-- https://beginners-guide-to-xmonad.readthedocs.io/configure_xmonadhs.html
main = do
	xmonad $ defaultConfig
		-- Simple configruation
		{ terminal = "rxvt-unicode"
		, borderWidth = 3
		} `additionalKeys`
		-- Additional keybindings
		[ ((mod1Mask, xK_p), spawn "dmenu_run -l 10 -fn 'DejaVu Sans Mono-15'")
		, ((mod1Mask, xK_grave), spawn "slock")
		]
