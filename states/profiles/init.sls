com.lisowski.config.security.mobileconfig:
  profile.installed:
    - force: true
    - description: Security Configuration
    - displayname: Security Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.SubmitDiagInfo
        PayloadDisplayName: "Security & Privacy"
        AutoSubmit: false
      - PayloadType: com.apple.systempolicy.control
        PayloadDisplayName: "Security & Privacy"
        EnableAssessment: true
        AllowIdentifiedDevelopers: true
      - PayloadType: com.apple.security.firewall
        PayloadDisplayName: "Security & Privacy"
        EnableFirewall: false
        BlockAllIncoming: false
        EnableStealthMode: false

{% set ad_profile_pw = salt['pillar.get']('profiles:ad:admin_pw') %}
{% if ad_profile_pw  %}
com.lisowski.config.directory.mobileconfig:
  profile.installed:
    - description: Directory Service Configuration
    - displayname: Directory Service Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.DirectoryService.managed
        PayloadDisplayName: Directory (ad.lis.local)
        ADCreateMobileAccountAtLoginFlag: true
        ADCreateMobileAccountAtLogin: true
        ADWarnUserBeforeCreatingMAFlag: true
        ADWarnUserBeforeCreatingMA: false
        ADForceHomeLocalFlag: true
        ADForceHomeLocal: true
        ADUseWindowsUNCPathFlag: true
        ADUseWindowsUNCPath: false
        ADMountStyle: "smb"
        ADDefaultUserShellFlag: true
        ADDefaultUserShell: "/bin/bash"
        ADMapUIDAttributeFlag: false
        ADMapGIDAttributeFlag: false
        ADMapGGIDAttributeFlag: false
        ADPreferredDCServerFlag: false
        ADDomainAdminGroupListFlag: true
        ADAllowMultiDomainAuthFlag: true
        ADAllowMultiDomainAuth: true
        DNamespaceFlag: true
        ADNamespace: "domain"
        ADPacketSignFlag: true
        ADPacketSign: "allow"
        ADPacketEncryptFlag: true
        ADPacketEncrypt: "allow"
        ADRestrictDDNSFlag: false
        ADTrustChangePassIntervalDaysFlag: true
        ADTrustChangePassIntervalDays: 14
        {% set admingroups = salt['pillar.get']('profiles:ad:admingroups','[\'mac admin accounts\']')  %}
        ADDomainAdminGroupList: ['{{ admingroups|join(',') }}']
        HostName: "{{ salt['pillar.get']('profiles:ad:admingroups','ad.lis.local')}}"
        UserName: "{{ salt['pillar.get']('profiles:ad:admingroups','administrator')}}"
        Password: "{{ ad_profile_pw }}"
{% endif %}

com.lisowski.config.dock.mobileconfig:
  profile.installed:
    - force: true
    - description: Dock Configuration
    - displayname: Dock Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.dock
        PayloadDisplayName: "Dock"
        orientation: 'bottom'
        position-immutable: true
        mineffect: 'scale'
        mineffect-immutable: true
        launchanim: true
        launchanim-immutable: true
        show-process-indicators: true
        show-process-indicators-immutable: true
        MCXDockSpecialFolders: ['AddDockMCXDocumentsFolder']
        contents-immutable: false
        static-only: false
        static-apps: []
        static-others: []
        autohide: true
        minimize-to-application: false
        magnification: true
        magnify-immutable: true

com.lisowski.config.loginwindow:
  profile.installed:
    - force: true
    - description: Loginwindows Configuration
    - displayname: Loginwindows Configuration
    - organization: Lisowski Family
    - content:
        - PayloadType: com.apple.loginwindow
        - RestartDisabledWhileLoggedIn: false
        - ShutDownDisabledWhileLoggedIn: false
        - AdminHostInfo: "HostName"
        - SHOWFULLNAME: true
        - HideLocalUsers: false
        - HideMobileAccounts: false
        - IncludeNetworkUser: false
        - SHOWOTHERUSERS_MANAGED: true
        - ShutDownDisabled: false
        - RestartDisabled: false
        - SleepDisabled: false
        - RetriesUntilHint: 3
        - DisableConsoleAccess: false
        - AdminMayDisableMCX: false
        - EnableExternalAccounts: true
        - AlwaysShowWorkgroupDialog: false
        - CombineUserWorkgroups: true
        - FlattenUserWorkgroups: false
        - LocalUserLoginEnabled: true
        - LocalUsersHaveWorkgroups: false
        - AllowList: []
        - DenyList: []
        - DisableLoginItemsSuppression: false
        - PayloadType: .GlobalPreferences
        - MultipleSessionEnabled: true
        - PayloadType: com.apple.SetupAssistant.managed
        - SkipCloudSetup: true
