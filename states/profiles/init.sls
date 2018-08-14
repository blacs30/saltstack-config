# Example creating an AD certificate request payload
---
com.lisowski.config.security.mobileconfig:
  profile.installed:
    - description: Security Configuration
    - displayname: Security Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.SubmitDiagInfo
        AutoSubmit: false
