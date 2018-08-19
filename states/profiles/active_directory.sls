{% set ad_profile_pw = salt['pillar.get']('profiles:ad:admin_pw') %}
{% if ad_profile_pw %}
com.lisowski.config.directory.mobileconfig:
  profile.installed:
    - force: true
    - description: Directory Service Configuration
    - displayname: Directory Service Configuration
    - organization: Lisowski Family
    - content:
      - PayloadType: com.apple.DirectoryService.managed
        PayloadDisplayName: "Active Directory"
        ADCreateMobileAccountAtLogin: true
        ADWarnUserBeforeCreatingMA: false
        ADForceHomeLocal: true
        ADUseWindowsUNCPath: false
        ADMountStyle: "smb"
        ADDefaultUserShell: "/bin/bash"
        ADAllowMultiDomainAuth: true
        ADNamespace: "domain"
        ADPacketSign: "allow"
        ADPacketEncrypt: "allow"
        ADTrustChangePassIntervalDays: 14
        {% set admingroups = salt['pillar.get']('profiles:ad:admingroups')  -%}
        ADDomainAdminGroupList: ['{{ admingroups|join('\',\'') }}']
        HostName: "{{ salt['pillar.get']('profiles:ad:hostname','ad.lis.local')}}"
        UserName: "{{ salt['pillar.get']('profiles:ad:adminuser','administrator')}}"
        Password: "{{ ad_profile_pw }}"
{% endif %}
