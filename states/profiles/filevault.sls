com.lisowski.config.filevaults:
  profile.installed:
    - force: true
    - description: FileVault Configuration
    - displayname: FileVault Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.SubmitDiagInfo
        PayloadDisplayName: "Security & Privacy"
        AutoSubmit: false
      - PayloadType: com.apple.systempolicy.control
        PayloadDisplayName: "Security & Privacy"
        EnableAssessment: true
        AllowIdentifiedDevelopers: true
      - PayloadType: com.apple.MCX.FileVault2
        PayloadDisplayName: "Security & Privacy"
        Enable: "On"
        Defer: true
        UseRecoveryKey: true
        UserEntersMissingInfo: false
        UseKeychain: true
        PayloadCertificateUUID: com.lisowski.config.filevaults.f7952336-bfa9-57b0-0de1-c9a5cd4c949a
      - PayloadType: com.apple.MCX
        PayloadDisplayName: "Security & Privacy"
        DestroyFVKeyOnStandby: true
        dontAllowFDEDisable: true
      - PayloadType: com.apple.preference.security
        PayloadDisplayName: "Security & Privacy"
      - PayloadType: com.apple.loginwindow
        PayloadDisplayName: "Security & Privacy"
      - PayloadType: com.apple.screensaver
        PayloadDisplayName: "Security & Privacy"
        askForPassword: true
        askForPasswordDelay: 0
      - PayloadType: com.apple.security.firewall
        PayloadDisplayName: "Security & Privacy"
        EnableFirewall: false
        BlockAllIncoming: false
        EnableStealthMode: false
        Applications: []
      - PayloadType: com.apple.applicationaccess
        PayloadDisplayName: "Security & Privacy"
        allowAutoUnlock: true
      - PayloadType: com.apple.security.root
        PayloadUUID: com.lisowski.config.filevaults.f7952336-bfa9-57b0-0de1-c9a5cd4c949a
        PayloadContent: |
            MIIDEDCCAfigAwIBAgIEFMKXODANBgkqhkiG9w0BAQsFADA5MR8wHQYDVQQD
            DBZGaWxlVmF1bHQgUmVjb3ZlcnkgS2V5MRYwFAYDVQQNDA1tYWMyLmxpcy5w
            cml2MB4XDTE4MDIxNDA1NTEzNVoXDTE5MDIxNDA1NTEzNVowOTEfMB0GA1UE
            AwwWRmlsZVZhdWx0IFJlY292ZXJ5IEtleTEWMBQGA1UEDQwNbWFjMi5saXMu
            cHJpdjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMGhAC7sBe2R
            NacW1KDiQOWH7lc8ebCh0wspJguBY/MUbiESCBLgeZaX01AvjH9YdPJWY7IT
            GLzAreQkXIZ8g5YYZl8Rl6TmbOG8RxnnredQaPaaT7Ar19rk54x1laZ/YOg8
            OpcoifYw5ziy3QB8QILiJGnHyQ+VxKcI1GQrBUXrXlS6FGrxCapdYfrL2xD+
            eLEs3f7a0+mGK5+9lSVeaQMRopkQ1cGaGuWX7QDwTSUu7Dt1/IQAMPLX+fGO
            gDSh2Chwt+BtAcrgJeenKuRj7/qIpJmRM3c5oVxD3PKqTUofm5kEhSCttSNy
            /I5Bv1yVxKZpa+DEleQidZGr//wqEtsCAwEAAaMgMB4wCwYDVR0PBAQDAgK0
            MA8GA1UdEwEB/wQFMAMBAQAwDQYJKoZIhvcNAQELBQADggEBAL1o95gUgMEZ
            AZnqU+XEaIcb9bVrp5IFz7AnEssPG5Gbz/NLLSnyDQTshFwYRPDh7viizHGv
            ky+mtTDjSmbmlcCfMtVbPHhrMEjhOTnN/mynJc5CurAwuln7lowUGAtr2v2y
            sF3VXdz4kM8sphsMROW96AKUTXNbTACiZOztS7o36cNNFV8cq7riOth3DDs2
            3ElinH7OH1oceHh8at8FnA/1ulOI6gcnXNEagQaNySO/8l7PRnnh0CHdOWGL
            8oirxJlbyZn6Rin8dDixUsX2CD8A6lYq9x10uZpc7gj0coIbtwlJjC7pIrsK
            IAhB42m/PcssFH96lEVkkUeDgpmMcmE=
