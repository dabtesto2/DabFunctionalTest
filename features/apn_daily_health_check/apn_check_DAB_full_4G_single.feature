  @apn_health_check_full
  Feature: Using Android Device check DAB FULL APN status using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"

    Examples:
      | apn                         | url                      | title  | no_links | data_conn_wait | device_profile |
      | idata-full-epg1             | https://www.ebay.co.uk   | google | 2        | 60             | OA             |
      | payandgo-full-epg2          | https://www.bbc.co.uk    | google | 2        | 60             | PC             |
      | tesco-full-vepg-vpgw-2      | https://www.amazon.co.uk | amazon | 2        | 60             | NDS            |
