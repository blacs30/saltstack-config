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
