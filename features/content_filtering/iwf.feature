  Feature: Verify if Device is blocked when trying to browse item from IWF for http and https

  @cf_iwf_full
  Scenario Outline: Block when user browse item from IWF using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE|HSPAP|HSUPA|HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "iwf" then user is blocked or redirected to page with "<content>" inside page

    Examples:
      | apn             | url                                                                           | content              | data_conn_wait | device_profile |
      | idata-full-epg1 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 30             | OA             |
      | idata-full-epg1 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 30             | OA             |
      | mvne1-full-epg1 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 30             | PC             |
      | mvne1-full-epg1 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 30             | PC             |
      | tesco-full-epg2 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 30             | NDS            |
      | tesco-full-epg2 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 30             | NDS            |

  @cf_iwf_func
  Scenario Outline: Block when user browse item from IWF using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE|HSPAP|HSUPA|HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "iwf" then user is blocked or redirected to page with "<content>" inside page

    Examples:
      | apn             | url                                                                           | content              | data_conn_wait | device_profile |
      | idata-func-epg1 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 30             | OA             |
      | idata-func-epg1 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 30             | OA             |
      | mvne1-func-epg1 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 30             | PC             |
      | mvne1-func-epg1 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 30             | PC             |
      | tesco-func-epg2 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 30             | NDS            |
      | tesco-func-epg2 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 30             | NDS            |

  @cf_iwf_serv
  Scenario Outline: Block when user browse item from IWF using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE|HSPAP|HSUPA|HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And if url in "iwf" then user is blocked or redirected to page with "<content>" inside page

    Examples:
      | apn             | url                                                                           | content              | data_conn_wait | device_profile |
      | idata-serv-epg1 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 30             | OA             |
      | idata-serv-epg1 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 30             | OA             |
      | mvne1-serv-epg1 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 30             | PC             |
      | mvne1-serv-epg1 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 30             | PC             |
      | tesco-serv-epg2 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 30             | NDS            |
      | tesco-serv-epg2 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 30             | NDS            |
