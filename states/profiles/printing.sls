com.lisowski.config.printing.mobileconfig:
  profile.installed:
    - force: true
    - description: Printing Configuration
    - displayname: Printing Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.mxcprinting
        PayloadDisplayName: "Printing"
        RequireAdminToAddPrinters: true
        AllowLocalPrinters: true
        RequireAdminToPrintLocally: false
        ShowOnlyManagedPrinters: false
        PrintFooter: false
        PrintMACAddress: false
        FooterFontSize: 7
        FooterFontName: 'Helvetica'
        DefaultPrinter: {'DeviceURI': 'dnssd://Brother%20MFC-9120CN._pdl-datastream._tcp.local./?bidi', 'DisplayName': 'Brother MFC-9120CN'}
        UserPrinterList: {'Brother_MFC_9120CN': {'DeviceURI': 'dnssd://Brother%20MFC-9120CN._pdl-datastream._tcp.local./?bidi', 'DisplayName': 'Brother MFC-9120CN', 'Location': '', 'Model': 'Brother MFC-9120CN CUPS', 'PrinterLocked': false, 'PPDURL': 'file://localhost/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Resources/Generic.ppd'}, 'Canon_i9950': {'DeviceURI': 'dnssd://Canon%20i9950._riousbprint._tcp.local./Canon%20i9950%20IGSMKT', 'DisplayName': 'Canon i9950', 'Location': 'airport4', 'Model': 'Canon i9950', 'PrinterLocked': false, 'PPDURL': 'file://localhost/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Resources/Generic.ppd'}}
