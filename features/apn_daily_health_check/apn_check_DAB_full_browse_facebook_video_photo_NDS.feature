  Feature: Using Android Device check Facebook Data using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
    Then FB browsing using "chrome" url "https://m.facebook.com" user "dabtesto2@gmail.com" password "nishanth123" and "<token>" wait "60"

    Examples:
      | apn             | token                                                                                                                                                                                        | data_conn_wait | device_profile |
      | mobile-full-epg1| EAACf85KzVCwBANcxoVxNX0ZAoTMDRDJk0eF4vK8CqJoc3N2ZCuQkFAeiJ3jFLkQ2CF60fLLUrLUUqZA6JdFPRZCbaDJoo0qNyb0nZAXgV4NCp9m3dAMASekcE4vChIfkguSaVqnazPZCMZBvPg7w0ydhJxZCZCkB0tuq1tRnHcBxx1QDZBAhUYigKb  | 15             | NDS            |