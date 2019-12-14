Feature: Using Android Device check DAB serv APN status using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<apn_data_connection_wait>" sec
    When Network connection status is "Data" collect device information
    Then Data can be downloaded for "<device_profile>" subscriber with network type "LTE"
    And Open "chrome" browser and get url "<url>"
    And Check if page loads with "<title>" and click "<no_links>" dynamic links

    Examples:
      | apn                         | url                      | title  | no_links | apn_data_connection_wait | device_profile|
      | idata-full-epg1             | https://www.google.co.uk | google |        2 |                        5 |OA             |