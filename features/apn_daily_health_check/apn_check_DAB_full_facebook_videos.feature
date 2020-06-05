  @apn_health_check_full
  Feature: Using Android Device check DAB FULL APN status using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     Then Open "chrome" browser and get url "<url>"

    Examples:
    @apn_health_check_full
  Feature: Using Android Device check DAB FULL APN status using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded with "<device_profile>" and network "LTE,HSPAP,HSUPA,HSPA" wait for "<data_conn_wait>" sec
      And Open "chrome" browser and get url "<url>"

    Examples:
      | apn             | url                                                                                                                                                                                                                                                                                                                    | data_conn_wait | device_profile |
      |idata-full-epg1  |https://video-lhr8-1.xx.fbcdn.net/v/t42.9040-2/101827982_3595557703804235_9073542308892246016_n.mp4?_nc_cat=101&_nc_sid=985c63&efg=eyJybHIiOjY0NiwicmxhIjo1MTIsInZlbmNvZGVfdGFnIjoibGVnYWN5X3NkIn0%3D&_nc_ohc=2hhsfEPxJroAX9ZYmHs&rl=646&vabr=359&_nc_ht=video-lhr8-1.xx&oh=0405557ca927769f48e972b79bbff71b&oe=5EDB8A1A|15              |PC              |