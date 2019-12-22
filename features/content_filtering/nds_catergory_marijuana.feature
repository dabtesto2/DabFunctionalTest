  Feature: Verify if Device is blocked when trying to browse item from marijuana category for http and https

  @cf_nds_cat_full
  Scenario Outline: Block when user browse item from marijuana category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat   | url                                  | content          | device_profile | data_conn_wait |
      | idata-full-epg2 | Marijuana | http://104.incompass.netstar-inc.com | over 18          | NDS            | 60             |
      | tesco-full-epg1 | Marijuana | http://www.marijuana.com             | over 18          | NDS            | 60             |
      | mvne1-full-epg1 | Marijuana | http://www.marijuana.com             | over-18          | NDS            | 60             |
      | idata-full-epg2 | Marijuana | http://104.incompass.netstar-inc.com | Parental Control | PC             | 60             |
      | tesco-full-epg2 | Marijuana | http://www.marijuana.com             | under 18         | PC             | 60             |

  @cf_nds_cat_func
  Scenario Outline: Block when user browse item from marijuana category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat   | url                                  | content          | device_profile | data_conn_wait |
      | idata-func-epg1 | Marijuana | http://104.incompass.netstar-inc.com | over 18          | NDS            | 60             |
      | tesco-func-epg1 | Marijuana | http://www.marijuana.com             | over 18          | NDS            | 60             |
      | mvne1-func-epg1 | Marijuana | http://www.marijuana.com             | over-18          | NDS            | 60             |
      | idata-func-epg2 | Marijuana | http://104.incompass.netstar-inc.com | Parental Control | PC             | 60             |
      | tesco-func-epg1 | Marijuana | http://www.marijuana.com             | under 18         | PC             | 60             |

  @cf_nds_cat_serv
  Scenario Outline: Block when user browse item from marijuana category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat   | url                                  | content          | device_profile | data_conn_wait |
      | idata-serv-epg1 | Marijuana | http://104.incompass.netstar-inc.com | over 18          | NDS            | 60             |
      | tesco-serv-epg1 | Marijuana | http://www.marijuana.com             | over 18          | NDS            | 60             |
      | mvne1-serv-epg1 | Marijuana | http://www.marijuana.com             | over-18          | NDS            | 60             |
      | idata-serv-epg2 | Marijuana | http://104.incompass.netstar-inc.com | Parental Control | PC             | 60             |
      | tesco-serv-epg1 | Marijuana | http://www.marijuana.com             | under 18         | PC             | 60             |