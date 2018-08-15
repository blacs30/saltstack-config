{% set ad_profile_pw = salt['pillar.get']('profiles:ad:admin_pw') %}
{% if ad_profile_pw %}
com.lisowski.config.directory.mobileconfig:
  profile.installed:
    - description: Directory Service Configuration
    - displayname: Directory Service Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.DirectoryService.managed
        PayloadDisplayName: "Active Directory"
        ADCreateMobileAccountAtLoginFlag: true
        ADCreateMobileAccountAtLogin: true
        ADWarnUserBeforeCreatingMAFlag: true
        ADWarnUserBeforeCreatingMA: false
        ADForceHomeLocalFlag: true
        ADForceHomeLocal: true
        ADUseWindowsUNCPathFlag: true
        ADUseWindowsUNCPath: false
        ADMountStyle: "smb"
        ADDefaultUserShellFlag: true
        ADDefaultUserShell: "/bin/bash"
        ADMapUIDAttributeFlag: false
        ADMapGIDAttributeFlag: false
        ADMapGGIDAttributeFlag: false
        ADPreferredDCServerFlag: false
        ADDomainAdminGroupListFlag: true
        ADAllowMultiDomainAuthFlag: true
        ADAllowMultiDomainAuth: true
        DNamespaceFlag: true
        ADNamespace: "domain"
        ADPacketSignFlag: true
        ADPacketSign: "allow"
        ADPacketEncryptFlag: true
        ADPacketEncrypt: "allow"
        ADRestrictDDNSFlag: false
        ADTrustChangePassIntervalDaysFlag: true
        ADTrustChangePassIntervalDays: 14
        {% set admingroups = salt['pillar.get']('profiles:ad:admingroups','[\'mac admin accounts\']')  %}
        ADDomainAdminGroupList: ['{{ admingroups|join(',') }}']
        HostName: "{{ salt['pillar.get']('profiles:ad:admingroups','ad.lis.local')}}"
        UserName: "{{ salt['pillar.get']('profiles:ad:admingroups','administrator')}}"
        Password: "{{ ad_profile_pw }}"
{% endif %}
