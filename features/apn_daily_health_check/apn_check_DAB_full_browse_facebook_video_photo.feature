  Feature: Using Android Device check Facebook Data using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     Then FB Browsing "chrome" "m.facebook.com" "dabtesto2@gmail.com" "Testdab!" "<token>" "45"

    Examples:
      | apn             | token                                                                                                                                                                                        | data_conn_wait | device_profile |
      | idata-full-epg1 | EAAhW5zZBlA3IBAGzAevjtREZBZC3PoAsNw7b50wqxZA7ZC4CPNQXGYIJ1MckvZB2LLOiVf2BX5HZBU3UHVuFGilJJutOd0GS8MZAQPBeQjdwsYqVMdFCQv3Ez8MolQIWtv9r1s4J7JysnowfjJc51rIBhDvSpT7f2YPY8OYGmgCft4BJMaiAe51P    | 15             | OA             |