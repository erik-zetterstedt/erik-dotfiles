import XMonad
import Data.Monoid
import System.Exit
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing

import qualified XMonad.StackSet as W
import qualified Data.Map as M

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_d     ), spawn "dmenu_run -fn \"Inconsolata:size=14\"")
    , ((modm              , xK_q     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_g     ), spawn "xmonad --recompile; xmonad --restart")
    , ((modm              , xK_p     ), spawn "~/.xscripts/toggle-mon.sh")
    , ((modm .|. shiftMask, xK_p     ), spawn "~/.xscripts/toggle-half-res.sh")
    , ((modm              , xK_o     ), spawn "~/.xscripts/toggle-pa-sink.sh")
    , ((modm              , xK_t     ), spawn "~/.xscripts/cycle-keyboards.sh")
    , ((0                 , xK_Print ), spawn "~/.xscripts/print-screen.sh")
    , ((0                , 0x1008ff02), spawn "xbacklight -inc 5")
    , ((0                , 0x1008ff03), spawn "xbacklight -dec 5")
    , ((shiftMask        , 0x1008ff02), spawn "xbacklight -inc 1")
    , ((shiftMask        , 0x1008ff03), spawn "xbacklight -dec 1")
    , ((0                , 0x1008ff11), spawn "~/.xscripts/set-vol.sh -5%")
    , ((0                , 0x1008ff13), spawn "~/.xscripts/set-vol.sh +5%")
    , ((modm              , xK_Escape), spawn "sleep 1 && xset dpms force off")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ]

myLayout = smartBorders $ spacingWithEdge 2 $ tiled ||| noBorders Full
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

main = xmonad def
  { terminal = "alacritty"
  , modMask = mod4Mask
  , borderWidth = 3
  , normalBorderColor = "#000000"
  , focusedBorderColor = "#b9ca4a"
  , keys = myKeys
  , mouseBindings = myMouseBindings
  , layoutHook = myLayout
  , focusFollowsMouse = False
  }
