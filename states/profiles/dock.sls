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
        position-immutable: false
        mineffect: 'suck'
        mineffect-immutable: false
        launchanim: false
        launchanim-immutable: false
        show-process-indicators: true
        show-process-indicators-immutable: false
        MCXDockSpecialFolders: ['AddDockMCXDocumentsFolder']
        contents-immutable: false
        static-only: false
        static-apps: []
        static-others: []
        autohide: true
        minimize-to-application: false
        magnification: true
        magnify-immutable: false
