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
