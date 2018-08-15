com.lisowski.config.mobility.mobileconfig:
  profile.installed:
    - force: true
    - description: Mobility Configuration
    - displayname: Mobility Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.homeSync
        PayloadDisplayName: "Mobility: Home Sync"
        syncPreferencesAtLogin: 'sync'
        syncPreferencesAtLogout: 'sync'
        syncPreferencesAtSyncNow: 'sync'
        syncPreferencesInBackground: 'sync'
        replaceUserPrefSyncList: true
        syncBackgroundSetAtLogin: 'sync'
        syncBackgroundSetAtLogout: 'sync'
        syncBackgroundSetAtSyncNow: 'sync'
        replaceUserSyncList: true
        periodicSyncOn: true
        syncPeriodSeconds: 300
        syncedFolders-managed: [{'path': '-'}]
        syncedPrefFolders-managed: [{'path': '~/Library'},{'path': '~/Documents/Microsoft User Data'}]
        excludedItems-managed: [{'values': '~/SymAVQSFile', 'comparison': 'fullPath'},{'value': '~/Documents/Microsoft User Data', 'comparison': 'fullPath'},{'value': '~/Library', 'comparison': 'fullPath'},{'value': '~/NAVMac800QSFile', 'comparison': 'fullPath'}]
        excludedPrefItems-managed: [{'value': '~/.SymAVQSFile', 'comparison': 'fullPath'}, {'value': '~/Documents/Microsoft User Data/Entourage Temp', 'comparison': 'fullPath'}, {'value': '~/Library/Application Support/SyncServices', 'comparison': 'fullPath'}, {'value': '~/Library/Application Support/MobileSync', 'comparison': 'fullPath'}, {'value': '~/Library/Caches', 'comparison': 'fullPath'}, {'value': '~/Library/Calendars/Calendar Cache', 'comparison': 'fullPath'}, {'value': '~/Library/Logs', 'comparison': 'fullPath'}, {'value': '~/Library/Mail/AvailableFeeds', 'comparison': 'fullPath'}, {'value': '~/Library/Mail/Envelope Index', 'comparison': 'fullPath'}, {'value': '~/Library/Preferences/Macromedia/Flash Player', 'comparison': 'fullPath'}, {'value': '~/Library/Printers', 'comparison': 'fullPath'}, {'value': '~/Library/PubSub/Database', 'comparison': 'fullPath'}, {'value', '~/Library/PubSub/Downloads', 'comparison': 'fullPath'}, {'value': '~/Library/PubSub/Feeds', 'comparison': 'fullPath'}, {'value': '~/Library/Safari/Icons.db', 'comparison': 'fullPath'}, {'value': '~/Library/Safari/HistoryIndex.sk', 'comparison': 'fullPath'}, {'value': '~/Library/iTunes/iPhone Software Updates', 'comparison': 'fullPath'}, {'value': 'IMAP-', 'comparison': 'startsWith'}, {'value': 'Exchange-', 'comparison': 'startsWith'}, {'value': 'EWS-', 'comparison': 'startsWith'}, {'value': 'Mac-', 'comparison': 'startsWith'}]
      - PayloadType: com.apple.mcxMenuExtras
        PayloadDisplayName: 'Mobility: Menu Extras'
