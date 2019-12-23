  Feature: Verify if PC subscribers is allowed to browse item KIDS CAT , U13 and PC white for http and https

  @pc_kids_cat_full

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"

    Examples:
      | apn             | url                       | title    | no_links | data_conn_wait | device_profile |
      | idata-full-epg1 | http://teach-ict.com/     | teach-ict| 2        | 10            | PC             |
      | tesco-full-epg1 | http://teach-ict.com/     | teach-ict| 2        | 10            | PC             |
      | idata-full-epg1 | https://www.bbc.co.uk     | bbc      | 2        | 10            | PC             |
      | tesco-full-epg1 | https://www.bbc.co.uk     | bbc      | 2        | 10            | PC             |
      | idata-full-epg1 | http://www.roalddahl.com/ | roal     | 2        | 10            | PC             |
      | tesco-full-epg1 | http://www.roalddahl.com/ | roal     | 2        | 10            | PC             |

  @pc_kids_cat_func

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"

    Examples:
      | apn             | url                       | title    | no_links | data_conn_wait | device_profile |
      | idata-func-epg1 | http://teach-ict.com/     | teach-ict| 2        | 10            | PC             |
      | tesco-func-epg1 | http://teach-ict.com/     | teach-ict| 2        | 10            | PC             |
      | idata-func-epg1 | https://www.bbc.co.uk     | bbc      | 2        | 10            | PC             |
      | tesco-func-epg1 | https://www.bbc.co.uk     | bbc      | 2        | 10            | PC             |
      | idata-func-epg1 | http://www.roalddahl.com/ | roal     | 2        | 10            | PC             |
      | tesco-func-epg1 | http://www.roalddahl.com/ | roal     | 2        | 10            | PC             |
  @pc_kids_cat_serv

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"
      And Check if page loads with "<title>" and click "<no_links>" links without error "ERR_TIMED_OUT"

    Examples:
      | apn             | url                       | title    | no_links | data_conn_wait | device_profile |
      | idata-serv-epg1 | http://teach-ict.com/     | teach-ict| 2        | 10            | PC             |
      | tesco-serv-epg1 | http://teach-ict.com/     | teach-ict| 2        | 10            | PC             |
      | idata-serv-epg1 | https://www.bbc.co.uk     | bbc      | 2        | 10            | PC             |
      | tesco-serv-epg1 | https://www.bbc.co.uk     | bbc      | 2        | 10            | PC             |
      | idata-serv-epg1 | http://www.roalddahl.com/ | roal     | 2        | 10            | PC             |
      | tesco-serv-epg1 | http://www.roalddahl.com/ | roal     | 2        | 10            | PC             |