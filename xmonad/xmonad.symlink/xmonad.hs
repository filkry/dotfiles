import XMonad
import XMonad.Actions.SwapWorkspaces
import XMonad.Actions.PhysicalScreens
--import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
--import XMonad.Hooks.FadeInactive
import XMonad.Layout.NoBorders
import System.IO
import Data.Monoid
import System.Exit
import XMonad.Config.Xfce
import XMonad.Hooks.ManageHelpers
--import XMonad.Hooks.SetWMName
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Layout.Fullscreen
 
import qualified Data.Map        as M
import qualified XMonad.StackSet as W

myModMask       = mod4Mask

myWorkspaceKeys = [xK_q, xK_w, xK_e, xK_a, xK_s, xK_d, xK_z, xK_x, xK_c]

myLayouts = noBorders $ fullscreenFull $ layoutHook xfceConfig

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    --launch gmrun
    , ((modm,               xK_y),      spawn "dmenu_run")

    -- close focussed window
    , ((modm .|. shiftMask, xK_k),      kill)

    -- Rotate through layout algms
    , ((modm,               xK_space),  sendMessage NextLayout)

    -- Move focus to next display
    , ((modm,               xK_r), onPrevNeighbour W.view)
    -- Move focus to next display
    , ((modm,               xK_f), onNextNeighbour W.view)

    -- Move focus to next window
    , ((modm,               xK_j),      windows W.focusDown)      
    -- Move focus to previous window
    , ((modm,               xK_k),      windows W.focusUp)      

    -- Swap focussed with master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- shrink master area
    , ((modm,               xK_h     ), sendMessage Shrink)
    -- expand master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- lock the screen
    -- todo: change this to xfce screensaver?
    -- , ((modm .|. shiftMask, xK_l     ), spawn "gnome-screensaver-command -l")

    -- dock floating window
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- quit xmonad
    , ((modm .|. shiftMask, xK_p     ), io (exitWith ExitSuccess))

    -- restart xmonad
    , ((modm              , xK_p     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) myWorkspaceKeys
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    -- ++ 
    --[((myModMask .|. controlMask, k), windows $ swapWithCurrent i)
    --   | (i, k) <- zip (XMonad.workspaces conf) myWorkspaceKeys]

conf = xfceConfig {
            layoutHook = myLayouts,
            modMask = myModMask,
            keys = myKeys,
            terminal = "urxvt",
            manageHook = composeAll
                [ manageHook xfceConfig
                , fullscreenManageHook
                , className =? "Steam"           --> doFloat
                , className =? "Gimp"            --> doFloat
                , isFullscreen --> doFullFloat
                ]
        } 

main = do
    xmonad conf
        { startupHook = startupHook conf
        }
