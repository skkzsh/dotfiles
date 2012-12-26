import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
    import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)

    import qualified XMonad.StackSet as W
    import XMonad.Util.WorkspaceCompare
    import XMonad.Actions.CycleWS

    import XMonad.Actions.WindowGo
    import XMonad.Util.EZConfig 

    import XMonad.Layout.IndependentScreens

    -- Modキーを変更
    -- ~/.Xmodmapで無変換キーをMod3に
    modm = mod3Mask 

    main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
{ manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
        { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
        }
    , terminal           = "gnome-terminal"
        , borderWidth        = 2
        , normalBorderColor  = "#333333"
        , focusedBorderColor = "#cd8b00"
        , modMask = modm 
}

`additionalKeys`
[
    -- Workspace移動
    ((modm, xK_l), nextWS) 
, ((modm, xK_h), prevWS)
    -- WindowのWorkspace移動
    , ((modm .|. shiftMask, xK_l), shiftToNext)
    , ((modm .|. shiftMask, xK_h), shiftToPrev) 
    , ((modm .|. controlMask, xK_l), shiftToNext >> nextWS) 
, ((modm .|. controlMask, xK_h), shiftToPrev >> prevWS) 
    -- , ((modm .|. controlMask, xK_1), windows $ W.shift "1" W.greedyView "1")
    -- , ((modm .|. controlMask, xK_2), windows $ W.shift "2")
    -- , ((modm .|. controlMask, xK_3), windows $ W.shift "3")
    -- , ((modm .|. controlMask, xK_4), windows $ W.shift "4")
    -- , ((modm .|. controlMask, xK_5), windows $ W.shift "5")
    -- , ((modm .|. controlMask, xK_6), windows $ W.shift "6")
    -- , ((modm .|. controlMask, xK_7), windows $ W.shift "7")
    -- , ((modm .|. controlMask, xK_8), windows $ W.shift "8")
    -- , ((modm .|. controlMask, xK_9), windows $ W.shift "9")
, ((modm, xK_z), toggleWS)
    -- Default設定を参照
    -- DefaultのKeyBindを別に割り当てる
    , ((modm, xK_Left), sendMessage Shrink)
, ((modm, xK_Right), sendMessage Expand)

    -- Application Shortcuts
    -- , ((modm .|. shiftMask .|. controlMask, xK_a), runOrRaise "synaptic" (className =? "Synaptic"))
    , ((modm .|. shiftMask .|. controlMask, xK_b), runOrRaise "thunderbird" (className =? "Thunderbird"))
    , ((modm .|. shiftMask .|. controlMask, xK_e), runOrRaise "emacs" (className =? "Emacs"))
    , ((modm .|. shiftMask .|. controlMask, xK_f), runOrRaise "firefox" (className =? "Firefox"))
    , ((modm .|. shiftMask .|. controlMask, xK_i), runOrRaise "rhythmbox" (className =? "Rhythmbox"))
    , ((modm .|. shiftMask .|. controlMask, xK_m), runOrRaise "mendeleydesktop" (className =? "Mendeley"))
    , ((modm .|. shiftMask .|. controlMask, xK_n), runOrRaise "/usr/NX/bin/nxclient" (className =? "NX"))
    --, ((modm .|. shiftMask .|. controlMask, xK_n), runOrRaise "nautilus --no-desktop" (className =? "Nautilus"))
    , ((modm .|. shiftMask .|. controlMask, xK_o), runOrRaise "opera" (className =? "Opera"))
    , ((modm .|. shiftMask .|. controlMask, xK_p), runOrRaise "gnome-network-properties" (className =? "Network"))
    , ((modm .|. shiftMask .|. controlMask, xK_r), runOrRaise "tsclient" (className =? "RemoteDesktop"))
    , ((modm .|. shiftMask .|. controlMask, xK_s), runOrRaise "quicksynergy" (className =? "Synergy"))
    , ((modm .|. shiftMask .|. controlMask, xK_v), runOrRaise "gvim" (className =? "Vim"))
    , ((shiftMask .|. controlMask, xK_Escape), runOrRaise "gnome-system-monitor" (className =? "System Monitor"))
    ]

