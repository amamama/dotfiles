import System.IO
import XMonad
import XMonad.Layout
import XMonad.Hooks.ManageDocks -- avoidsrtuts
import XMonad.Hooks.ManageHelpers -- doCenterFloat
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS

myTerminal      = "urxvt"
myBorderWidth   = 2
myModMask       = mod4Mask
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]
myNormalBorderColor  = "#004499"
myFocusedBorderColor = "#4499ee"

myLogHook tbar sbar = do
	dynamicLogWithPP $ defaultPP {
      ppOrder     = \(ws:l:t:_)  -> [t]
    , ppOutput    = hPutStrLn tbar
    --, ppOutput    = putStrLn
    , ppWsSep     = ""
    , ppSep       = " : "
}
	dynamicLogWithPP $ defaultPP {
      ppOrder     = \(ws:l:t:_)  -> [ws,l]
    , ppCurrent   = xmobarColor  "green" "#111111" . wrap "[" "]"
    , ppUrgent    = wrap "{" "}"
    , ppVisible   = wrap "(" ")"
    , ppHidden    = wrap " " " "
    --, ppHiddenNoWindows = xmobarColor  colfg    colbg . wrap "/" "\\"
    , ppOutput    = hPutStrLn sbar
    --, ppOutput    = putStrLn
    , ppWsSep     = ""
    , ppSep       = " : "
}

myStartupHook = return ()
myManageHook = composeAll [
	className =? "xmessage"			--> doCenterFloat,
	resource  =? "xmessage"			--> doCenterFloat ]
myTitleWsBar = "xmobar ~/.config/xmobar/xmobar_title.rc"
myStatusWsBar = "xmobar ~/.config/xmobar/xmobar_status.rc"
myFont = "xft:Ricty:size=18:antialias=true"

myAdditionalKeys = [
	((myModMask, xK_z), toggleWS) ,
	((myModMask, xK_b), moveTo Prev NonEmptyWS) ,
	((myModMask, xK_f), moveTo Next NonEmptyWS) ,
	((myModMask, xK_p), prevWS) ,
	((myModMask, xK_n), nextWS) ,
	((myModMask, xK_r), spawn ("dmenu_run -fn '" ++ myFont ++ "'" )) ]

myRemoveKeys = [
	(myModMask, xK_r) ,
	(myModMask, xK_n) ,
	(myModMask, xK_p) ]

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
	titleWsBar <- spawnPipe myTitleWsBar
	statusWsBar <- spawnPipe myStatusWsBar
	xmonad $ defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        -- hook
        layoutHook         = avoidStruts $ layoutHook defaultConfig,
        logHook            = myLogHook titleWsBar statusWsBar,
        startupHook        = myStartupHook,
        manageHook         = manageHook defaultConfig <+> manageDocks <+> myManageHook,
        handleEventHook    = handleEventHook defaultConfig <+> docksEventHook
    } `removeKeys` myRemoveKeys `additionalKeys` myAdditionalKeys
