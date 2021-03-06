  Feature: Verify if NDS subscriber is allowed when trying to browse item from bbfc_white list for http and https

  @cf_nds_bbfc_white_full

  Scenario Outline: allow user to browse item from bbfc_white list using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"
    Examples:
      | apn             | title | url                   | no_links | device_profile | data_conn_wait |
      | tesco-full-epg2 | bedes | http://www.bedes.org/ | 1        | NDS            | 60             |
      | idata-full-epg1 | bedes | http://www.bedes.org/ | 1        | NDS            | 60             |
      | mvne1-full-epg1 | bedes | http://www.bedes.org/ | 1        | NDS            | 60             |

  @cf_nds_bbfc_white_func

  Scenario Outline: allow user to browse item from bbfc_white  list using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"
    Examples:
      | apn             | title | url                   | no_links | device_profile | data_conn_wait |
      | tesco-func-epg2 | bedes | http://www.bedes.org/ | 1        | NDS            | 60             |
      | idata-func-epg1 | bedes | http://www.bedes.org/ | 1        | NDS            | 60             |
      | mvne1-func-epg1 | bedes | http://www.bedes.org/ | 1        | NDS            | 60             |

  @cf_nds_bbfc_white_serv

  Scenario Outline: allow user to browse item from bbfc_white  list using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"
    Examples:
      | apn             | title | url                   | no_links | device_profile | data_conn_wait |
      | tesco-serv-epg2 | bedes | http://www.bedes.org/ | 1        | NDS            | 60             |
      | idata-serv-epg1 | bedes | http://www.bedes.org/ | 1        | NDS            | 60             |
      | mvne1-serv-epg1 | bedes | http://www.bedes.org/ | 1        | NDS            | 60             |