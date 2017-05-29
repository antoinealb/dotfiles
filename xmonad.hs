import XMonad
import XMonad.Util.EZConfig -- used for key bindings

-- Allow management of dock programs.
import XMonad.Hooks.ManageDocks

-- Extended Window Manager Hints, useful for OOo
import XMonad.Hooks.EwmhDesktops
import XMonad.Config.Kde
import XMonad.Layout.Spacing

keyBindings =
    [ ("M-S-w", spawn "google-chrome-stable")
    , ("M-S-e", spawn "dolphin")
    ]

defaults = kdeConfig {
      -- simple stuff
        terminal           = "konsole",
        manageHook         = manageDocks <+> manageHook defaultConfig,
        layoutHook         = avoidStruts $ spacing 10 $ layoutHook defaultConfig,
        focusFollowsMouse  = False
    } `additionalKeysP` keyBindings

main = xmonad $ ewmh defaults
