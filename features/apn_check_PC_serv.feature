@serv_apn_pc
Feature: Using Android Device with PC profile run apn test using chrome

  Scenario Outline: With Android Device profile setup the context
    Given Android device using "NDS" select apn "<apn>" and wait for "<apn_data_connection_wait>" sec
    When Network connection status is "Data" collect device information
    Then Open "chrome" browser and get url "<url>"
    Then Check if page loads with "<title>" and click "<no_links>" dynamic links

    Examples:
      | apn                         | url                      | title  | no_links | apn_data_connection_wait |
      | idata-serv-epg1             | https://www.google.co.uk | google |        2 |                        5 |
      | mobile-serv-epg1            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | ibrowse-serv-epg1           | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | m-bb-serv-epg1              | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | isetup-serv-epg1            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | modem-serv-epg1             | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | mvne1-serv-epg1             | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | tesco-serv-epg1             | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | payandgo-serv-epg1          | https://www.google.co.uk | google |        2 |                        5 |
      | wap-serv-epg1               | https://www.google.co.uk | google |        2 |                        5 |
      | wap-serv-epg1-legacy        | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | vpn-serv-epg1               | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | idata-serv-epg2             | https://www.google.co.uk | google |        2 |                        5 |
      | mobile-serv-epg2            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | ibrowse-serv-epg2           | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | m-bb-serv-epg2              | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | isetup-serv-epg2            | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | modem-serv-epg2             | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | mvne1-serv-epg2             | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | tesco-serv-epg2             | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | payandgo-serv-epg2          | https://www.google.co.uk | google |        2 |                        5 |
      | wap-serv-epg2               | https://www.google.co.uk | google |        2 |                        5 |
      | wap-serv-epg2-legacy        | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | vpn-serv-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | idata-serv-vepg-vpgw-2      | https://www.google.co.uk | google |        2 |                        5 |
      | mobile-serv-vepg-vpgw-2     | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | ibrowse-serv-vepg-vpgw-2    | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | m-bb-serv-vepg-vpgw-2       | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | isetup-serv-vepg-vpgw-2     | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | modem-serv-vepg-vpgw-2      | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
      | mvne1-serv-vepg-vpgw-2      | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | tesco-serv-vepg-vpgw-2      | https://www.amazon.co.uk | amazon |        2 |                        5 |
      | payandgo-serv-vepg-vpgw-2   | https://www.google.co.uk | google |        2 |                        5 |
      | wap-serv-vepg-vpgw-2        | https://www.google.co.uk | google |        2 |                        5 |
      | wap-serv-vepg-vpgw-2-legacy | https://www.bbc.co.uk    | bbc    |        2 |                        5 |
      | vpn-serv-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   |        2 |                        5 |
