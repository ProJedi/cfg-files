import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Actions.NoBorders
import XMonad.Util.Scratchpad
import Data.Monoid
import System.Exit
import XMonad.Prompt
import XMonad.Prompt.AppLauncher as AL
import XMonad.Prompt.Shell
import Data.List
import XMonad.Layout.NoBorders

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , title =? "VideochatMainWindow" --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    ]

myEventHook = mempty

myLogHook = return ()

myStartupHook = return ()

toggleStrutsKey :: XConfig t -> (KeyMask, KeySym)
toggleStrutsKey XConfig{modMask = modm} = (modm, xK_b )

main = xmonad =<< statusBar "/usr/bin/xmobar" myPP toggleStrutsKey myConfig

myPP = defaultPP { --ppCurrent = xmobarColor "#268bd2" "" . wrap "[" "]"
                   ppCurrent = wrap "[" "]"
                 --, ppTitle   = xmobarColor "#268bd2" ""
                 , ppVisible = wrap "(" ")"
                 }

myConfig = defaultConfig {
        terminal           = "urxvtc",
        focusFollowsMouse  = True,
        borderWidth        = 1,
        modMask            = mod4Mask,
        workspaces         = ["1","2","3","4","5","6","7","8","9"],
        normalBorderColor  = "#073642",
        focusedBorderColor = "#586e75",
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
}  

myLayout = smartBorders tiled ||| noBorders Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myXPConfig = XPC { font = "xft:Anonymous Pro-8:antialias=false"
                 , bgColor = "#002b36"
                 , fgColor = "#839496"
                 , fgHLight = "#93a1a1"
                 , bgHLight = "#586e75"
                 , borderColor = "#839496"
                 , promptBorderWidth = 0
                 , promptKeymap = defaultXPKeymap
                 , completionKey = xK_Tab
                 , position = Bottom
                 , height = 15
                 , historySize = 256
                 , historyFilter = id
                 , defaultText = []
                 , autoComplete = Nothing
                 , showCompletionOnTab = False
                 , searchPredicate = isInfixOf
                 }

myKeys conf = mkKeymap conf $
   [ ("M-S-<Return>", spawn $ XMonad.terminal conf)
   , ("M-u", AL.launchApp myXPConfig "evince")
   , ("M-<D>", spawn "mpc toggle")
   , ("M-S-<L>", spawn "mpc prev")
   , ("M-S-<R>", spawn "mpc next")
   , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%-")
   , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+")
   , ("<Print>", spawn "scrot /tmp/shot-%Y-%m-%d.png")
   , ("M-S-l", spawn "xscreensaver-command -lock")
   --, ("M-p", spawn "dmenu_run -fn 'Anonymous Pro-8' -nb '#002b36' -nf '#839496' -sb '#073642' -sf '#93a1a1'")
   , ("M-p", shellPrompt myXPConfig)
   , ("M-<F4>", kill)
   , ("M-<Space>", sendMessage NextLayout)
   , ("M-r", refresh)
   , ("M-j", windows W.focusDown)
   , ("M-k", windows W.focusUp)
   , ("M-<Return>", windows W.swapMaster)
   , ("M-h", sendMessage Shrink)
   , ("M-l", sendMessage Expand)
   , ("M-t", withFocused $ windows . W.sink)
   , ("M-,", sendMessage (IncMasterN 1))
   , ("M-.", sendMessage (IncMasterN (-1)))
   --, ("M-g", withFocused toggleBorder)
   , ("M-S-q", io (exitWith ExitSuccess))
   , ("M-q", spawn "xmonad --recompile; xmonad --restart")
   , ("<F12>", scratchpadSpawnActionTerminal "urxvtc")
   ] ++ [ ("M-" ++ m ++ k, windows $ f i)
        | (i, k) <- zip (workspaces conf) (map show [1..9])
        , (f, m) <- [(W.greedyView, ""), (W.shift, "S-")]
   ] ++ [ ("M-" ++ m ++ k, screenWorkspace sc >>= flip whenJust (windows . f))
        | (k, sc) <- zip ["w", "e", "r"] [0..]
        , (f, m) <- [(W.view, ""), (W.shift, "S-")]
   ]
