  Feature: Verify if Device is blocked when trying to browse item from DEA list for http and https

  @cf_dea_full

  Scenario Outline: Block when user browse item from IWF using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "DEA" then user is blocked or redirected to page with "<content>" inside page

    Examples:
      | apn             | url                                                | content | data_conn_wait | device_profile |
      | idata-full-epg1 | http://www.dea-enforced.incompass.netstar-inc.com/ | blocked | 60             | OA             |
      | tesco-full-epg1 | http://www.dea-enforced.incompass.netstar-inc.com/ | blocked | 60             | PC             |
      | mvne1-full-epg2 | http://www.dea-enforced.incompass.netstar-inc.com/ | blocked | 60             | NDS            |

  @cf_dea_func

  Scenario Outline: Block when user browse item from IWF using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "iwf" then user is blocked or redirected to page with "<content>" inside page

    Examples:
      | apn             | url                                                | content | data_conn_wait | device_profile |
      | idata-func-epg1 | http://www.dea-enforced.incompass.netstar-inc.com/ | blocked | 60             | OA             |
      | tesco-func-epg1 | http://www.dea-enforced.incompass.netstar-inc.com/ | blocked | 60             | PC             |
      | mvne1-func-epg2 | http://www.dea-enforced.incompass.netstar-inc.com/ | blocked | 60             | NDS            |

  @cf_dea_serv

  Scenario Outline: Block when user browse item from IWF using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "iwf" then user is blocked or redirected to page with "<content>" inside page

    Examples:
      | apn             | url                                                | content | data_conn_wait | device_profile |
      | idata-serv-epg1 | http://www.dea-enforced.incompass.netstar-inc.com/ | blocked | 60             | OA             |
      | tesco-serv-epg1 | http://www.dea-enforced.incompass.netstar-inc.com/ | blocked | 60             | PC             |
      | mvne1-serv-epg2 | http://www.dea-enforced.incompass.netstar-inc.com/ | blocked | 60             | NDS            |

