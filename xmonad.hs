--
-- xmonad config file.
--
-- (c) Antoine Albertelli 2014

import XMonad
import XMonad.Util.EZConfig -- used for key bindings

-- Allow management of dock programs.
import XMonad.Hooks.ManageDocks

-- Extended Window Manager Hints, useful for OOo
import XMonad.Hooks.EwmhDesktops
import XMonad.Config.Kde


defaults = kdeConfig {
      -- simple stuff
        terminal           = "konsole",
        manageHook         = manageDocks <+> manageHook defaultConfig,
        layoutHook         = avoidStruts $ layoutHook defaultConfig,
        focusFollowsMouse  = False
    }

main = xmonad $ ewmh defaults
