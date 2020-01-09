Feature: Test the web page

Scenario Outline: Test the web page
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open chrome browser and get url "<url>"
    Examples:
      | apn             | url                        | data_conn_wait| device_profile |
      | idata-serv-epg1 | https://www.grunenthal.com | 60            | OA             |
