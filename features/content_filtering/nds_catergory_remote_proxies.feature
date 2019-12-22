  Feature: Verify if Device is blocked when trying to browse item from remote proxies blocked category for http and https

  @cf_nds_cat_full
  Scenario Outline: Block when user browse item from remote proxies category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat        | url                                  | content          | device_profile | data_conn_wait |
      | idata-full-epg2 | Remote-Proxies | http://anonymizer.com                | over 18          | NDS            | 60             |
      | mvne1-full-epg1 | Remote-Proxies | http://403.incompass.netstar-inc.com | over-18          | NDS            | 60             |
      | tesco-full-epg1 | Remote-Proxies | http://anonymizer.com                | over 18          | NDS            | 60             |
      | idata-full-epg2 | Remote-Proxies | http://403.incompass.netstar-inc.com | Parental Control | PC             | 60             |
      | tesco-full-epg2 | Remote-Proxies | http://anonymizer.com                | under 18         | PC             | 60             |

  @cf_nds_cat_func
  Scenario Outline: Block when user browse item from remote proxies category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat        | url                                  | content          | device_profile | data_conn_wait |
      | idata-func-epg2 | Remote-Proxies | http://anonymizer.com                | over 18          | NDS            | 60             |
      | mvne1-func-epg1 | Remote-Proxies | http://403.incompass.netstar-inc.com | over-18          | NDS            | 60             |
      | tesco-func-epg1 | Remote-Proxies | http://anonymizer.com                | over 18          | NDS            | 60             |
      | idata-func-epg2 | Remote-Proxies | http://403.incompass.netstar-inc.com | Parental Control | PC             | 60             |
      | tesco-func-epg2 | Remote-Proxies | http://anonymizer.com                | under 18         | PC             | 60             |

  @cf_nds_cat_serv
  Scenario Outline: Block when user browse item from remote proxies category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat        | url                                  | content          | device_profile | data_conn_wait |
      | idata-serv-epg2 | Remote-Proxies | http://anonymizer.com                | over 18          | NDS            | 60             |
      | mvne1-serv-epg1 | Remote-Proxies | http://403.incompass.netstar-inc.com | over-18          | NDS            | 60             |
      | tesco-serv-epg1 | Remote-Proxies | http://anonymizer.com                | over 18          | NDS            | 60             |
      | idata-serv-epg2 | Remote-Proxies | http://403.incompass.netstar-inc.com | Parental Control | PC             | 60             |
      | tesco-serv-epg2 | Remote-Proxies | http://anonymizer.com                | under 18         | PC             | 60             |

