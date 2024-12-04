{ pkgs, user, ... }: {
  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #  Incomplete list of macOS `defaults` commands :
  #    https://github.com/yannbertrand/macos-defaults
  #
  ###################################################################################
  system = {
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      # Customize settings that not supported by nix-darwin directly
      # see the source code of this project to get more undocumented options:
      #    https://github.com/rgcr/m-cli
      # 
      # All custom entries can be found by running `defaults read` command.
      # or `defaults read xxx` to read a specific domain.
      CustomUserPreferences = {
        NSGlobalDomain = {
          AppleLanguages = [
              "en-SG"
              "zh-Hans-SG"
          ];
          AppleLocale = ["en_SG"];
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
          allowIdentifierForAdvertising = false;
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;
        "com.apple.print.PrintingPrefs" = {
          # Automatically quit printer app once the print jobs complete
          "Quit When Finished" = true;
        };
        "com.apple.SoftwareUpdate" = {
          # https://developer.apple.com/documentation/devicemanagement/softwareupdate
          AutomaticallyInstallAppUpdates = true;
          AutomaticCheckEnabled = true;
          AutomaticDownload = true;
          ConfigDataInstall = true;
          CriticalUpdateInstall = true;
        };
      };

      # customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      #   https://github.com/yannbertrand/macos-defaults
      NSGlobalDomain = {
        # `defaults read NSGlobalDomain "xxx"`
        AppleInterfaceStyle = "Dark";  # dark mode
        AppleKeyboardUIMode = 3;  # Mode 3 enables full keyboard control.
        AppleMetricUnits = 1;
        AppleMeasurementUnits = "Centimeters";
        AppleTemperatureUnit = "Celsius";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;

        InitialKeyRepeat = 15;  # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        KeyRepeat = 2;  # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSDisableAutomaticTermination = true;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSUseAnimatedFocusRing = false;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;

        "com.apple.swipescrolldirection" = false;  # enable natural scrolling
        "com.apple.sound.beep.feedback" = 0;  # disable beep sound when pressing volume up/down key
      };

      controlcenter = {
        BatteryShowPercentage = true;
        Bluetooth = true;
      };

      dock = {
        autohide = false;
        largesize = 16;
        launchanim = false;
        mineffect = "scale";
        minimize-to-application = true;
        persistent-apps = [
          "/System/Applications/Calendar.app"
          "/Applications/Firefox.app"
          "/Applications/Brave Browser.app"
          "${pkgs.slack}/Applications/Slack.app"
          "${pkgs.wezterm}/Applications/WezTerm.app"
          "${pkgs.vscode}/Applications/Visual Studio Code.app"
          "/Applications/GitHub Desktop.app"
        ];
        persistent-others = [
          "${user.home}/Downloads"
        ];
        show-recents = false;
        tilesize = 56;
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "clmv";
        FXRemoveOldTrashItems = true;
        QuitMenuItem = true;
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = true;
        ShowMountedServersOnDesktop = true;
        ShowPathbar = true;
        ShowRemovableMediaOnDesktop = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
        _FXSortFoldersFirst = true;
        _FXSortFoldersFirstOnDesktop = true;
      };

      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = true;
      };

      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 1;
        ShowDayOfMonth = true;
      };

      screencapture = {
        disable-shadow = true;
        location = "~/Downloads";
        type = "png";
      };

      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };

      trackpad = {
        Clicking = true;
        Dragging = true;
        FirstClickThreshold = 1;
        SecondClickThreshold = 2;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
        TrackpadThreeFingerTapGesture = 2;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape  = true;
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;
}
