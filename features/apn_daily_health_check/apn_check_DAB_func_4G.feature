  @apn_health_check_func
  Feature: Using Android Device check DAB func APN status using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"

    Examples:
      | apn                         | url                      | title  | no_links | data_conn_wait | device_profile |
      | idata-func-epg1             | https://www.google.co.uk | google | 2        | 60             | OA             |
      | mobile-func-epg1            | https://www.amazon.co.uk | amazon | 2        | 60             | NDS            |
      | ibrowse-func-epg1           | https://www.ebay.co.uk   | ebay   | 2        | 60             | OA             |
      | m-bb-func-epg1              | https://www.bbc.co.uk    | bbc    | 2        | 60             | PC             |
      | isetup-func-epg1            | https://www.amazon.co.uk | amazon | 2        | 60             | NDS            |
      | modem-func-epg1             | https://www.ebay.co.uk   | ebay   | 2        | 60             | OA             |
      | mvne1-func-epg1             | https://www.bbc.co.uk    | bbc    | 2        | 60             | PC             |
      | tesco-func-epg1             | https://www.amazon.co.uk | amazon | 2        | 60             | OA             |
      | payandgo-func-epg1          | https://www.google.co.uk | google | 2        | 60             | NDS            |
      | wap-func-epg1               | https://www.google.co.uk | google | 2        | 60             | OA             |
      | wap-func-epg1-legacy        | https://www.bbc.co.uk    | bbc    | 2        | 60             | PC             |
      | vpn-func-epg1               | https://www.ebay.co.uk   | ebay   | 2        | 60             | NDS            |
      | idata-func-epg2             | https://www.google.co.uk | google | 2        | 60             | OA             |
      | mobile-func-epg2            | https://www.amazon.co.uk | amazon | 2        | 60             | NDS            |
      | ibrowse-func-epg2           | https://www.ebay.co.uk   | ebay   | 2        | 60             | OA             |
      | m-bb-func-epg2              | https://www.bbc.co.uk    | bbc    | 2        | 60             | PC             |
      | isetup-func-epg2            | https://www.amazon.co.uk | amazon | 2        | 60             | NDS            |
      | modem-func-epg2             | https://www.ebay.co.uk   | ebay   | 2        | 60             | OA             |
      | mvne1-func-epg2             | https://www.bbc.co.uk    | bbc    | 2        | 60             | PC             |
      | tesco-func-epg2             | https://www.amazon.co.uk | amazon | 2        | 60             | NDS            |
      | payandgo-func-epg2          | https://www.google.co.uk | google | 2        | 60             | OA             |
      | wap-func-epg2               | https://www.google.co.uk | google | 2        | 60             | NDS            |
      | wap-func-epg2-legacy        | https://www.bbc.co.uk    | bbc    | 2        | 60             | PC             |
      | vpn-func-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   | 2        | 60             | NDS            |
      | idata-func-vepg-vpgw-2      | https://www.google.co.uk | google | 2        | 60             | OA             |
      | mobile-func-vepg-vpgw-2     | https://www.amazon.co.uk | amazon | 2        | 60             | NDS            |
      | ibrowse-func-vepg-vpgw-2    | https://www.ebay.co.uk   | ebay   | 2        | 60             | OA             |
      | m-bb-func-vepg-vpgw-2       | https://www.bbc.co.uk    | bbc    | 2        | 60             | PC             |
      | isetup-func-vepg-vpgw-2     | https://www.amazon.co.uk | amazon | 2        | 60             | OA             |
      | modem-func-vepg-vpgw-2      | https://www.ebay.co.uk   | ebay   | 2        | 60             | NDS            |
      | mvne1-func-vepg-vpgw-2      | https://www.bbc.co.uk    | bbc    | 2        | 60             | PC             |
      | tesco-func-vepg-vpgw-2      | https://www.amazon.co.uk | amazon | 2        | 60             | OA             |
      | payandgo-func-vepg-vpgw-2   | https://www.google.co.uk | google | 2        | 60             | NDS            |
      | wap-func-vepg-vpgw-2        | https://www.google.co.uk | google | 2        | 60             | OA             |
      | wap-func-vepg-vpgw-2-legacy | https://www.bbc.co.uk    | bbc    | 2        | 60             | PC             |
      | vpn-func-vepg-vpgw-2        | https://www.ebay.co.uk   | ebay   | 2        | 60             | NDS            |