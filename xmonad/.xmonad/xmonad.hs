import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W

main = do
    xmonad $ defaultConfig

        -- Simple configuration
        { workspaces = myWorkspaces
        , terminal = "rxvt-unicode"
        , borderWidth = 3
        } `additionalKeys` myKeys

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myKeys =

    -- Additional keybindings
    [ (( mod1Mask, xK_p ), spawn "dmenu_run -l 10 -fn 'DejaVu Sans Mono-15'" )
    , (( mod1Mask .|. controlMask, xK_l ), spawn "slock" )
    ]

    ++   -- (++) is needed here because the following list comprehension
         -- is a list, not a single key binding. Simply adding it to the
         -- list of key bindings would result in something like [ b1, b2,
         -- [ b3, b4, b5 ] ] resulting in a type error. (Lists must
         -- contain items all of the same type.)

    -- Change GreedyView to view
    [((m .|. mod1Mask, k), windows $ f i) -- Replace 'mod1Mask' with your mod key of choice.
         | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
         , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
