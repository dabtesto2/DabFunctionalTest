  Feature: Verify if Device is blocked when trying to browse item from o2 grey list for http and https

  @cf_nds_cat_o2_grey_full

  Scenario Outline: Block when user browse item from o2 grey  list using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat | url                                           | content | device_profile | data_conn_wait |
      | tesco-full-epg2 | o2_grey | http://www.o2-grey.incompass.netstar-inc.com/ | over 18 | NDS            | 60             |
      | idata-full-epg1 | o2_grey | http://www.hydrodaze.co.uk/                   | over 18 | NDS            | 60             |
      | mvne1-full-epg1 | o2_grey | http://www.siska.tv/                          | over-18 | NDS            | 60             |

  @cf_nds_cat_o2_grey_func

  Scenario Outline: Block when user browse item from o2 grey  list using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat | url                         | content | device_profile | data_conn_wait |
      | tesco-func-epg2 | o2_grey | http://www.sigmaspy.com/    | over 18 | NDS            | 60             |
      | idata-func-epg1 | o2_grey | http://www.hydrodaze.co.uk/ | over 18 | NDS            | 60             |
      | mvne1-func-epg1 | o2_grey | http://www.siska.tv/        | over-18 | NDS            | 60             |

  @cf_nds_cat_o2_grey_serv

  Scenario Outline: Block when user browse item from o2 grey  list using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat | url                         | content | device_profile | data_conn_wait |
      | tesco-serv-epg2 | o2_grey | http://www.sigmaspy.com/    | over 18 | NDS            | 60             |
      | idata-serv-epg1 | o2_grey | http://www.hydrodaze.co.uk/ | over 18 | NDS            | 60             |
      | mvne1-serv-epg1 | o2_grey | http://www.siska.tv/        | over-18 | NDS            | 60             |
