  @cf_blacklist
  Feature: Verify if Device is blocked when trying to browse item from blacklist for http and https
  
  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded for "<device_profile>" subscriber with network type "LTE"
      And Open "chrome" browser and get url "<url>"
      And if url in blacklist then user is blocked with "ERR_CONNECTION_RESET" or redirected to page "<content>"
  
    Examples: 
      | apn                  | url                                                | content       | data_conn_wait | device_profile | 
      | idata-full-epg1      | http://www.o2-blacklist.incompass.netstar-inc.com/ | Access denied | 5              | OA             | 
      | mobile-full-epg2     | http://www.dip.cc/                                 | Access denied | 5              | NDS            | 
      | ibrowse-full-epg1    | http://www.o2-blacklist.incompass.netstar-inc.com/ | Access denied | 5              | OA             | 
      | m-bb-full-epg2       | http://www.dip.cc/                                 | Access denied | 5              | PC             | 
      | isetup-full-epg1     | http://www.o2-blacklist.incompass.netstar-inc.com/ | Access denied | 5              | NDS            | 
      | modem-full-epg2      | http://www.dip.cc/                                 | Access denied | 5              | OA             | 
      | mvne1-full-epg1      | http://www.o2-blacklist.incompass.netstar-inc.com/ | Access denied | 5              | PC             | 
      | tesco-full-epg2      | http://www.dip.cc/                                 | Access denied | 5              | OA             | 
      | payandgo-full-epg1   | http://www.dip.cc/                                 | Access denied | 5              | NDS            | 
      | wap-full-epg2        | http://www.o2-blacklist.incompass.netstar-inc.com/ | Access denied | 5              | OA             | 
      | wap-full-epg1-legacy | http://www.dip.cc/                                 | Access denied | 5              | PC             | 
      | vpn-full-epg2        | https://www.ebay.co.uk                             | Access denied | 5              | NDS            | 
  
  