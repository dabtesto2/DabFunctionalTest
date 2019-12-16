 Feature: Verify if Device is blocked when trying to browse item from NDS blocked category for http and https

  @cf_nds_cat_full

  Scenario Outline: Block when user browse item from NDS blocked category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded for "<device_profile>" subscriber with network type "LTE"
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat              | url                                   | content       | device_profile | data_conn_wait |
      | idata-full-epg1 | Hacking-Cracking     | http://mirror-h.org                   | Access denied | NDS            | 5              |
      | mvne1-full-epg1 | Hacking-Cracking     | http://401.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | tesco-full-epg1 | Remote-Proxies       | http://anonymizer.com                 | Access denied | NDS            | 5              |
