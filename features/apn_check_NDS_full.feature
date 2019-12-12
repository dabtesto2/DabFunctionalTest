@full_apn_nds
Feature: Using Android Device with NDS profile run apn test using chrome

  Scenario Outline: With Android Device profile setup the context
    Given Android device using "NDS" select apn "<apn>" and wait for "<apn_data_connection_wait>" sec
    When Network connection status is "Data" collect device information
    Then Data can be downloaded for "NDS" subscriber with network type "LTE"
    And Open "chrome" browser and get url "<url>"
    And Check if page loads with "<title>" and click "<no_links>" dynamic links

    Examples:
      | apn                         | url                      | title  | no_links | apn_data_connection_wait |
      | idata-full-epg1             | https://www.google.co.uk | google |        2 |                        5 |
      | mobile-full-epg1            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | ibrowse-full-epg1           | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | m-bb-full-epg1              | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | isetup-full-epg1            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | modem-full-epg1             | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | mvne1-full-epg1             | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | tesco-full-epg1             | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | payandgo-full-epg1          | https://www.google.co.uk | google |        2 |                        5 |
      | wap-full-epg1               | https://www.google.co.uk | google |        2 |                        5 |
      | wap-full-epg1-legacy        | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | vpn-full-epg1               | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | idata-full-epg2             | https://www.google.co.uk | google |        2 |                        5 |
      | mobile-full-epg2            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | ibrowse-full-epg2           | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | m-bb-full-epg2              | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | isetup-full-epg2            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | modem-full-epg2             | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | mvne1-full-epg2             | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | tesco-full-epg2             | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | payandgo-full-epg2          | https://www.google.co.uk | google |        2 |                        5 |
      | wap-full-epg2               | https://www.google.co.uk | google |        2 |                        5 |
      | wap-full-epg2-legacy        | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | vpn-full-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | idata-full-vepg-vpgw-2      | https://www.google.co.uk | google |        2 |                        5 |
      | mobile-full-vepg-vpgw-2     | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | ibrowse-full-vepg-vpgw-2    | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | m-bb-full-vepg-vpgw-2       | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | isetup-full-vepg-vpgw-2     | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | modem-full-vepg-vpgw-2      | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | mvne1-full-vepg-vpgw-2      | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | tesco-full-vepg-vpgw-2      | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | payandgo-full-vepg-vpgw-2   | https://www.google.co.uk | google |        2 |                        5 |
      | wap-full-vepg-vpgw-2        | https://www.google.co.uk | google |        2 |                        5 |
      | wap-full-vepg-vpgw-2-legacy | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | vpn-full-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
