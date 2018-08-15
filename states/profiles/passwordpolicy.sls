com.lisowski.config.passwordpolicy.mobileconfig:
  profile.installed:
    - force: true
    - description: Password Policy
    - displayname: Password Policy
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.mobiledevice.passwordpolicy
        PayloadDisplayName: "Passcode"
        allowSimple: false
        forcePIN: true
        requireAlphanumeric: false
        minLength: 8
        maxPINAgeInDays: 730
        pinHistory: 2
        maxFailedAttempts: 9
