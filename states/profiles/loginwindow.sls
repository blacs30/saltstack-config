com.lisowski.config.loginwindow:
  profile.installed:
    - force: true
    - description: Loginwindows Configuration
    - displayname: Loginwindows Configuration
    - organization: Lisowski Family
    - content:
        - PayloadType: com.apple.loginwindow
          PayloadDisplayName: "Loginwindow"
          RestartDisabledWhileLoggedIn: false
          ShutDownDisabledWhileLoggedIn: false
          AdminHostInfo: "HostName"
          SHOWFULLNAME: true
          HideLocalUsers: false
          HideMobileAccounts: false
          IncludeNetworkUser: false
          SHOWOTHERUSERS_MANAGED: true
          ShutDownDisabled: false
          RestartDisabled: false
          SleepDisabled: false
          RetriesUntilHint: 3
          DisableConsoleAccess: false
          AdminMayDisableMCX: false
          EnableExternalAccounts: true
          AlwaysShowWorkgroupDialog: false
          CombineUserWorkgroups: true
          FlattenUserWorkgroups: false
          LocalUserLoginEnabled: true
          LocalUsersHaveWorkgroups: false
          AllowList: []
          DenyList: []
          DisableLoginItemsSuppression: false
        - PayloadType: .GlobalPreferences
          MultipleSessionEnabled: true
        - PayloadType: com.apple.SetupAssistant.managed
          SkipCloudSetup: true
