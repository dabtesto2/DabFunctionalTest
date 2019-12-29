  Feature: Verify if Device is blocked when trying to browse item from bbfc_white list for http and https

  @cf_nds_bbfc_white_full

  Scenario Outline: Block when user browse item from bbfc_white  list using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"
    Examples:
      | apn             | title | url                    | no_links | device_profile | data_conn_wait |
      | tesco-full-epg2 | sex   | http://www.sexfor.mobi/| 1        | NDS            | 60             |
      | idata-full-epg1 | sex   | http://www.sexfor.mobi/| 1        | NDS            | 60             |
      | mvne1-full-epg1 | sex   | http://www.sexfor.mobi/| 1        | NDS            | 60             |

  @cf_nds_bbfc_white_func

  Scenario Outline: Block when user browse item from bbfc_white  list using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"
    Examples:
      | apn             | title | url                    | no_links | device_profile | data_conn_wait |
      | tesco-func-epg2 | sex   | http://www.sexfor.mobi/| 1        | NDS            | 60             |
      | idata-func-epg1 | sex   | http://www.sexfor.mobi/| 1        | NDS            | 60             |
      | mvne1-func-epg1 | sex   | http://www.sexfor.mobi/| 1        | NDS            | 60             |

  @cf_nds_bbfc_white_serv

  Scenario Outline: Block when user browse item from bbfc_white  list using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"
    Examples:
      | apn             | title | url                    | no_links | device_profile | data_conn_wait |
      | tesco-serv-epg2 | sex   | http://www.sexfor.mobi/| 1        | NDS            | 60             |
      | idata-serv-epg1 | sex   | http://www.sexfor.mobi/| 1        | NDS            | 60             |
      | mvne1-serv-epg1 | sex   | http://www.sexfor.mobi/| 1        | NDS            | 60             |