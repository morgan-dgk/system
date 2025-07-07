{firefox-addons, ...}: {
  programs.zen-browser = {
    enable = true;

    profiles.morgan = {
      extensions = {
        force = true;
        packages = with firefox-addons.packages.x86_64-linux; [
          bitwarden
          darkreader
          dearrow
          consent-o-matic
          ublock-origin
        ];
      };
    };

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
