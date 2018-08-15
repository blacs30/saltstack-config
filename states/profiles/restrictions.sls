com.lisowski.config.restrictions.mobileconfig:
  profile.installed:
    - force: true
    - description: Restrictions
    - displayname: Restrictions
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.dashboard
        PayloadDisplayName: "Dashboard Widget Restrictions"
        whiteListEnabled: false
        WhiteList: []
      - PayloadType: com.apple.systemuiserver
        PayloadDisplayName: Restrictions
        logout-eject: {'all-media': ''}
        mount-controls: {'blankcd':[], 'blankdvd': [],
                        'cd': [], 'dvd': [], 'dvdram': [],
                        'disk-image': [], 'harddisk-external': [],
                        'harddisk-internal': []}
      - PayloadType: com.apple.DiscRecording
        PayloadDisplayName: "Media Access: Disc Recording"
        BurnSupport: 'on'
      - PayloadType: com.apple.finder
        PayloadDisplayName: "Media Access: Finder Settings"
        ProhibitBurn: false
        InterfaceLevel: 'Full'
        ShowHardDrivesOnDesktop: true
        ShowExternalHardDrivesOnDesktop: true
        ShowRemovableMediaOnDesktop: true
        ShowMountedServersOnDesktop: true
        WarnOnEmptyTrash: true
        ProhibitConnectTo: false
        ProhibitEject: false
        ProhibitGoToFolder: false
      - PayloadType: com.apple.appstore
        PayloadDisplayName: 'App Store'
        restrict-store-softwareupdate-only: false
        restrict-store-disable-app-adoption: false
        restrict-store-require-admin-to-install: false
      - PayloadType: com.apple.ShareKitHelper
        PayloadDisplayName: Restrictions
        SHKAllowedShareServices: ['com.apple.share.AirDrop','com.apple.share.Facebook','com.apple.share.Twitter','com.apple.share.Mail','com.apple.share.Messages','com.apple.share.addtoiphoto','com.apple.share.addtoaperture','com.apple.share.readlater','com.apple.reminders.RemindersShareExtension','com.apple.Notes.SharingExtension','com.apple.share.LinkedIn.post']
      - PayloadType: com.apple.gamed
        PayloadDisplayName: 'Game Center'
        GKFeatureGameCenterAllowed: false
        GKFeatureAccountModificationAllowed: true
        GKFeatureAddingGameCenterFriendsAllowed: true
        GKFeatureMultiplayerGamingAllowed: true
      - PayloadType: com.apple.MXA
        PayloadDisplayName: Restrictions
        safariAllowAutoFill: false
        DestroyFVKeyOnStandby: true
        dontAllowFDEDisable: true
        DisableGuestAccount: true
        EnableGuestAccount: false
        com.apple.EnergySaver.desktop.ACPower-ProfileNumber: -1
        com.apple.EnergySaver.portable.ACPower-ProfileNumber: -1
        com.apple.EnergySaver.portable.BatteryPower-ProfileNumber: -1
        com.apple.EnergySaver.desktop.ACPower: {'Automatic Restart On Power Loss': 1, 'Disk Sleep Timer-boolean': false, 'Display Sleep Timer': 20, 'Sleep On Power Button': 1, 'System Sleep Timer': 0, 'Wake On LAN': 1}
        com.apple.EnergySaver.portable.ACPower: {'Automatic Restart On Power Loss': 1, 'Disk Sleep Timer-boolean': false, 'Display Sleep Timer': 20, 'System Sleep Timer': 0, 'Wake On LAN': 1}
        com.apple.EnergySaver.portable.BatteryPower: {'Automatic Restart On Power Loss': 0, 'Disk Sleep Timer-boolean': true, 'Display Sleep Timer': 5, 'System Sleep Timer': 10, 'Wake On LAN': 1}
        cachedaccounts.WarnOnCreate.allowNever: false
        com.apple.cachedaccounts.CreateAtLogin: true
        com.apple.cachedaccounts.CreatePHDAtLogin: false
        com.apple.cachedaccounts.WarnOnCreate: false
        cachedaccounts.create.encrypt: false
        cachedaccounts.create.encrypt.requireMasterPassword: false
        cachedaccounts.create.location: 'startup'
        cachedaccounts.create.maxSize: ''
        cachedaccounts.create.maxSize.fixedSize: '262144000'
        cachedaccounts.create.maxSize.percentOfNetworkHome: 100
        cachedaccounts.expiry.delete.disusedSeconds: -1
        cachedaccounts.expiry.cond.successfulSync: true
      - PayloadType: com.apple.coremediaio.support
        PayloadDisplayName: Restrictions
        'Device Access Allowed': true
      - PayloadType: com.apple.applicationaccess
        PayloadDisplayName: Restrictions
        allowCloudDocumentSync: true
        allowCloudDesktopAndDocuments: false
        allowSpotlightInternetResults: false
        allowCloudKeychainSync: true
        allowMusicService: true
        allowCloudMail: true
        allowCloudAddressBook: true
        allowCloudCalendar: true
        allowCloudReminders: true
        allowCloudBookmarks: true
        allowCloudNotes: true
        allowAutoUnlock: true
      - PayloadType: com.apple.preferences.users
        PayloadDisplayName: Restrictions
        DisableUsingiCloudPassword: true
