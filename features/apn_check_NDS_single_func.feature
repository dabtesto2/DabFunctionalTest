@func_apn_nds
Feature: Using Android Device with NDS profile run apn test using chrome

  Scenario Outline: With Android Device profile setup the context
    #Given Android device using "PC" select apn "<apn>" and wait for "<apn_data_connection_wait>" sec
    #When Network connection status is "Data" collect device information
    Then Data can be downloaded for "NDS" subscriber with network type "LTE"
    #Then Open "chrome" browser and get url "<url>"
    #Then Check if page loads with "<title>" and click "<no_links>" dynamic links

    Examples:
      | apn                         | url                      | title  | no_links | apn_data_connection_wait |
      | ibrowse-func-epg1           | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
