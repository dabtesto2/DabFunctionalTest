Feature: Test the web page

Scenario Outline: Test the web page
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
    Then Open chrome browser and get url "<url>"
    And Check if page loads with "<title>" and click "<no_links>" links

    Examples:
      | apn             | url                        | title | data_conn_wait| device_profile | no_links |
      | idata-serv-epg1 | https://www.grunenthal.com |  grun | 60            | OA             |    70    |