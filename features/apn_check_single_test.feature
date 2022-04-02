  Feature: Verify if Device is blocked when trying to browse item from blacklist for http and https

  @cf_blacklist_full

  Scenario Outline: Block when user browse item from Blacklist using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "blacklist" then user is blocked or redirected to page with "<content>" inside page

    Examples:
      | apn             | url                                                 | content              | data_conn_wait | device_profile |
      | idata-full-epg1 | http://www.o2-blacklist.incompass.netstar-inc.com/  | Access denied        | 10             | OA             |
      | mobile-full-epg1| https://www.o2-blacklist.incompass.netstar-inc.com/ | ERR_CONNECTION_RESET | 60            | OA             |
      | idata-full-epg1 | http://www.o2-blacklist.incompass.netstar-inc.com/  | Access denied        | 60            | PC             |
      | idata-full-epg1 | https://www.dip.cc/                                 | ERR_TIMED_OUT        | 60            | PC             |
      | mobile-full-epg2| https://www.mobile-spy.com/                         | ERR_CONNECTION_RESET | 60            | NDS            |
      | mobile-full-epg2| http://www.dip.cc/                                  | Access denied        | 60            | NDS            |
