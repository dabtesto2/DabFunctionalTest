@func_apn_nds
Feature: Using Android Device with NDS profile run apn test using chrome

  Scenario Outline: With Android Device profile setup the context
    Given Android device using "NDS" select apn "<apn>" and wait for "<apn_data_connection_wait>" sec
    When Network connection status is "Data" collect device information
    Then Data can be downloaded for "NDS" subscriber with network type "LTE"
    And Open "chrome" browser and get url "<url>"
    And Check if page loads with "<title>" and click "<no_links>" dynamic links

    Examples:
      | apn                         | url                      | title  | no_links | apn_data_connection_wait |
      | idata-func-epg1             | https://www.google.co.uk | google |        2 |                        5 |
      | mobile-func-epg1            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | ibrowse-func-epg1           | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | m-bb-func-epg1              | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | isetup-func-epg1            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | modem-func-epg1             | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | mvne1-func-epg1             | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | tesco-func-epg1             | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | payandgo-func-epg1          | https://www.google.co.uk | google |        2 |                        5 |
      | wap-func-epg1               | https://www.google.co.uk | google |        2 |                        5 |
      | wap-func-epg1-legacy        | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | vpn-func-epg1               | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | idata-func-epg2             | https://www.google.co.uk | google |        2 |                        5 |
      | mobile-func-epg2            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | ibrowse-func-epg2           | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | m-bb-func-epg2              | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | isetup-func-epg2            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | modem-func-epg2             | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | mvne1-func-epg2             | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | tesco-func-epg2             | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | payandgo-func-epg2          | https://www.google.co.uk | google |        2 |                        5 |
      | wap-func-epg2               | https://www.google.co.uk | google |        2 |                        5 |
      | wap-func-epg2-legacy        | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | vpn-func-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | idata-func-vepg-vpgw-2      | https://www.google.co.uk | google |        2 |                        5 |
      | mobile-func-vepg-vpgw-2     | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | ibrowse-func-vepg-vpgw-2    | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | m-bb-func-vepg-vpgw-2       | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | isetup-func-vepg-vpgw-2     | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | modem-func-vepg-vpgw-2      | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | mvne1-func-vepg-vpgw-2      | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | tesco-func-vepg-vpgw-2      | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | payandgo-func-vepg-vpgw-2   | https://www.google.co.uk | google |        2 |                        5 |
      | wap-func-vepg-vpgw-2        | https://www.google.co.uk | google |        2 |                        5 |
      | wap-func-vepg-vpgw-2-legacy | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | vpn-func-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
