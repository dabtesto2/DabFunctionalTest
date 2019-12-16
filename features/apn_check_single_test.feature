 Feature: Verify if Device is blocked when trying to browse item from IWF for http and https

  Scenario Outline: Block when user browse item from IWF using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded for "<device_profile>" subscriber with network type "LTE"
      And Open "chrome" browser and get url "<url>"
      And if url in "iwf" then user is blocked or redirected to page with "<content>" inside page

    Examples:
      | apn             | url                                                                           | content              | data_conn_wait | device_profile |
      | mvne1-full-epg1 | http://ec2-3-136-212-197.us-east-2.compute.amazonaws.com/iwftest/?id=102&vw=7 | Access denied        | 5              | OA             |
      | mvne1-full-epg1 | https://o2uyhlezymcd.vandviwf.com                                             | ERR_CONNECTION_RESET | 5              | OA             |
