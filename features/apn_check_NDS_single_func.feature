@func_apn_nds
Feature: Using Android Device with NDS profile run apn test using chrome

  Scenario Outline: With Android Device profile setup the context
    Given Android device using "NDS" select apn "<apn>" and wait for "<apn_data_connection_wait>" sec
    When Network connection status is "Data" collect device information
    Then Data can be downloaded for "NDS" subscriber with network type "LTE"
    And Open "chrome" browser and get url "<url>"
    And Check if page loads with "<title>" and click "<no_links>" dynamic links

    Examples:
      | apn                       | url                                     | title  | no_links | apn_data_connection_wait |
      | tesco-func-epg1           | https://102.incompass.netstar-inc.com   | 102   |        2 |                        5 |
