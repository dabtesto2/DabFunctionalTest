  Feature: Using Android Device check Facebook Data using 4G

  Scenario Outline: With Android Device profile setup the context for <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
    Then FB browsing using "chrome" url "https://m.facebook.com" user "so2dabo2@gmail.com" password "Testdab!" and "<token>" wait "60"

    Examples:
      | apn             | token                                                                                                                                                                                        | data_conn_wait | device_profile |
      | mobile-full-epg2| EAAEX49WxWTQBAFvxvxCHYW12llH5GG73qvPZCeHe9GRoaj3UqbSSW3swEJgXfE17JTJUNf3zRnAzo7z8X5KEUti6p9DborXXjScYT7eAFKFNaLQoXdiXdIXtbb0fSWc5oO0vZBmVmOAWCr5SDFpFOh5JK7Lz6cWey1mJtpjOZAtQyukuiXZC        | 15             | PC             |