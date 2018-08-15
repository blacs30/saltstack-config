com.lisowski.config.screensaver.mobileconfig:
  profile.installed:
    - force: true
    - description: Screensaver Configuration
    - displayname: Screensaver Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.screensaver
        PayloadDisplayName: "Security & Privacy"
        askForPassword: true
        askForPasswordDelay: 0
        loginWindowIdleTime: 0
        idleTime: 0
