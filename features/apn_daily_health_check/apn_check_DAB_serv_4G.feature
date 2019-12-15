@serv_apn_health_check
Feature: Using Android Device check DAB serv APN status using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<apn_data_connection_wait>" sec
    When Network connection status is "Data" collect device information
    Then Data can be downloaded for "<device_profile>" subscriber with network type "LTE"
    And Open "chrome" browser and get url "<url>"
    And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"

    Examples:
      | apn                         | url                      | title  | no_links | apn_data_connection_wait | device_profile|
      | idata-serv-epg1             | https://www.google.co.uk | google |        2 |                        5 |OA             |
      | mobile-serv-epg1            | https://www.amazon.co.uk | amazon |        2 |                        5 |NDS            |
      | ibrowse-serv-epg1           | https://www.ebay.co.uk   | ebay   |        2 |                        5 |OA             |
      | m-bb-serv-epg1              | https://www.bbc.co.uk    | bbc    |        2 |                        5 |PC             |
      | isetup-serv-epg1            | https://www.amazon.co.uk | amazon |        2 |                        5 |NDS            |
      | modem-serv-epg1             | https://www.ebay.co.uk   | ebay   |        2 |                        5 |OA             |
      | mvne1-serv-epg1             | https://www.bbc.co.uk    | bbc    |        2 |                        5 |PC             |
      | tesco-serv-epg1             | https://www.amazon.co.uk | amazon |        2 |                        5 |OA             |
      | payandgo-serv-epg1          | https://www.google.co.uk | google |        2 |                        5 |NDS            |
      | wap-serv-epg1               | https://www.google.co.uk | google |        2 |                        5 |OA             |
      | wap-serv-epg1-legacy        | https://www.bbc.co.uk    | bbc    |        2 |                        5 |PC             |
      | vpn-serv-epg1               | https://www.ebay.co.uk   | ebay   |        2 |                        5 |NDS            |
      | idata-serv-epg2             | https://www.google.co.uk | google |        2 |                        5 |OA             |
      | mobile-serv-epg2            | https://www.amazon.co.uk | amazon |        2 |                        5 |NDS            |
      | ibrowse-serv-epg2           | https://www.ebay.co.uk   | ebay   |        2 |                        5 |OA             |
      | m-bb-serv-epg2              | https://www.bbc.co.uk    | bbc    |        2 |                        5 |PC             |
      | isetup-serv-epg2            | https://www.amazon.co.uk | amazon |        2 |                        5 |NDS            |
      | modem-serv-epg2             | https://www.ebay.co.uk   | ebay   |        2 |                        5 |OA             |
      | mvne1-serv-epg2             | https://www.bbc.co.uk    | bbc    |        2 |                        5 |PC             |
      | tesco-serv-epg2             | https://www.amazon.co.uk | amazon |        2 |                        5 |NDS            |
      | payandgo-serv-epg2          | https://www.google.co.uk | google |        2 |                        5 |OA             |
      | wap-serv-epg2               | https://www.google.co.uk | google |        2 |                        5 |NDS            |
      | wap-serv-epg2-legacy        | https://www.bbc.co.uk    | bbc    |        2 |                        5 |PC             |
      | vpn-serv-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   |        2 |                        5 |NDS            |
      | idata-serv-vepg-vpgw-2      | https://www.google.co.uk | google |        2 |                        5 |OA             |
      | mobile-serv-vepg-vpgw-2     | https://www.amazon.co.uk | amazon |        2 |                        5 |NDS            |
      | ibrowse-serv-vepg-vpgw-2    | https://www.ebay.co.uk   | ebay   |        2 |                        5 |OA             |
      | m-bb-serv-vepg-vpgw-2       | https://www.bbc.co.uk    | bbc    |        2 |                        5 |PC             |
      | isetup-serv-vepg-vpgw-2     | https://www.amazon.co.uk | amazon |        2 |                        5 |OA             |
      | modem-serv-vepg-vpgw-2      | https://www.ebay.co.uk   | ebay   |        2 |                        5 |NDS            |
      | mvne1-serv-vepg-vpgw-2      | https://www.bbc.co.uk    | bbc    |        2 |                        5 |PC             |
      | tesco-serv-vepg-vpgw-2      | https://www.amazon.co.uk | amazon |        2 |                        5 |OA             |
      | payandgo-serv-vepg-vpgw-2   | https://www.google.co.uk | google |        2 |                        5 |NDS            |
      | wap-serv-vepg-vpgw-2        | https://www.google.co.uk | google |        2 |                        5 |OA             |
      | wap-serv-vepg-vpgw-2-legacy | https://www.bbc.co.uk    | bbc    |        2 |                        5 |PC             |
      | vpn-serv-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   |        2 |                        5 |NDS            |
