  @apn_health_check_full
  Feature: Using Android Device check DAB FULL APN status using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Open "chrome" browser and get url "<url>"

    Examples:
      | apn             | url                                                                                                                                                                                                                                                 | data_conn_wait | device_profile |
      | idata-full-epg1 | https://scontent-lht6-1.xx.fbcdn.net/v/t1.0-0/s130x130/78696679_116147300120882_6556723475237568512_n.jpg?_nc_cat=108&_nc_sid=110474&_nc_ohc=tMB4my74YbIAX-sVL7Y&_nc_ht=scontent-lht6-1.xx&_nc_tp=7&oh=7bebc903179682e2c893d87018247fa9&oe=5F01CEE5 | 15             | OA             |

