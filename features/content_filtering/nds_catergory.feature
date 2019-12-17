  Feature: Verify if Device is blocked when trying to browse item from NDS blocked category for http and https

  @cf_nds_cat_full
  Scenario Outline: Block when user browse item from NDS blocked category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded for "<device_profile>" subscriber with network type "LTE"
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat              | url                                   | content       | device_profile | data_conn_wait |
      | idata-full-epg1 | Hacking-Cracking     | http://mirror-h.org                   | Access denied | NDS            | 5              |
      | use-same-apn    | Illegal-Drugs        | http://www.drug-testing-detox.com     | Access denied | NDS            | 5              |
      | use-same-apn    | Marijuana            | http://104.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Fetish               | http://1505.incompass.netstar-inc.com | Access denied | NDS            | 5              |
      | use-same-apn    | Violence-Suicide     | http://101.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Hate-Slander         | http://kkk.com                        | Access denied | NDS            | 5              |
      | use-same-apn    | Sexual-Services      | http://303.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | mvne1-full-epg2 | Adult-SearchLinks    | http://304.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Hacking-Cracking     | http://401.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Remote-Proxies       | http://403.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Illegal-Drugs        | http://102.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Violence-Suicide     | http://fakepassport.info              | Access denied | NDS            | 5              |
      | use-same-apn    | Terrorism-Extremists | http:/201.incompass.netstar-inc.com   | Access denied | NDS            | 5              |
      | use-same-apn    | Fetish               | https://fetlife.com                   | Access denied | NDS            | 5              |
      | tesco-full-epg1 | Remote-Proxies       | http://anonymizer.com                 | Access denied | NDS            | 5              |
      | use-same-apn    | Hate-Slander         | http://203.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Terrorism-Extremists | http://www.terroristwebsites.info     | Access denied | NDS            | 5              |
      | use-same-apn    | Marijuana            | http://www.marijuana.com              | Access denied | NDS            | 5              |
      | use-same-apn    | Pornography          | http://301.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Sexual-Services      | http://www.companionsescorts.com      | Access denied | NDS            | 5              |
      | use-same-apn    | Adult-SearchLinks    | http://boodigo.com                    | Access denied | NDS            | 5              |
      | idata-full-epg2 | Hacking-Cracking     | http://mirror-h.org                   | Access denied | PC             | 5              |
      | use-same-apn    | Illegal-Drugs        | http://www.drug-testing-detox.com     | Access denied | PC             | 5              |
      | use-same-apn    | Violence-Suicide     | http://101.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Marijuana            | http://104.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Hate-Slander         | http://kkk.com                        | Access denied | PC             | 5              |
      | use-same-apn    | Fetish               | http://1505.incompass.netstar-inc.com | Access denied | PC             | 5              |
      | use-same-apn    | Sexual-Services      | http://303.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | mvne1-full-epg1 | Hacking-Cracking     | http://401.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Remote-Proxies       | http://403.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Illegal-Drugs        | http://102.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Violence-Suicide     | http://fakepassport.info              | Access denied | PC             | 5              |
      | use-same-apn    | Terrorism-Extremists | http:/201.incompass.netstar-inc.com   | Access denied | PC             | 5              |
      | use-same-apn    | Fetish               | https://fetlife.com                   | Access denied | PC             | 5              |
      | use-same-apn    | Adult-SearchLinks    | http://304.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | tesco-full-epg1 | Remote-Proxies       | http://anonymizer.com                 | Access denied | PC             | 5              |
      | use-same-apn    | Marijuana            | http://www.marijuana.com              | Access denied | PC             | 5              |
      | use-same-apn    | Pornography          | http://301.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Terrorism-Extremists | http://www.terroristwebsites.info     | Access denied | PC             | 5              |
      | use-same-apn    | Hate-Slander         | http://203.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Sexual-Services      | http://www.companionsescorts.com      | Access denied | PC             | 5              |
      | use-same-apn    | Adult-SearchLinks    | http://boodigo.com                    | Access denied | PC             | 5              |

  @cf_nds_cat_func

  Scenario Outline: Block when user browse item from NDS blocked category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded for "<device_profile>" subscriber with network type "LTE"
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat              | url                                   | content       | device_profile | data_conn_wait |
      | idata-func-epg1 | Hacking-Cracking     | http://mirror-h.org                   | Access denied | NDS            | 5              |
      | use-same-apn    | Illegal-Drugs        | http://www.drug-testing-detox.com     | Access denied | NDS            | 5              |
      | use-same-apn    | Marijuana            | http://104.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Fetish               | http://1505.incompass.netstar-inc.com | Access denied | NDS            | 5              |
      | use-same-apn    | Violence-Suicide     | http://101.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Hate-Slander         | http://kkk.com                        | Access denied | NDS            | 5              |
      | use-same-apn    | Sexual-Services      | http://303.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | mvne1-func-epg2 | Adult-SearchLinks    | http://304.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Hacking-Cracking     | http://401.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Remote-Proxies       | http://403.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Illegal-Drugs        | http://102.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Violence-Suicide     | http://fakepassport.info              | Access denied | NDS            | 5              |
      | use-same-apn    | Terrorism-Extremists | http:/201.incompass.netstar-inc.com   | Access denied | NDS            | 5              |
      | use-same-apn    | Fetish               | https://fetlife.com                   | Access denied | NDS            | 5              |
      | tesco-func-epg1 | Remote-Proxies       | http://anonymizer.com                 | Access denied | NDS            | 5              |
      | use-same-apn    | Hate-Slander         | http://203.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Terrorism-Extremists | http://www.terroristwebsites.info     | Access denied | NDS            | 5              |
      | use-same-apn    | Marijuana            | http://www.marijuana.com              | Access denied | NDS            | 5              |
      | use-same-apn    | Pornography          | http://301.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Sexual-Services      | http://www.companionsescorts.com      | Access denied | NDS            | 5              |
      | use-same-apn    | Adult-SearchLinks    | http://boodigo.com                    | Access denied | NDS            | 5              |
      | idata-func-epg2 | Hacking-Cracking     | http://mirror-h.org                   | Access denied | PC             | 5              |
      | use-same-apn    | Illegal-Drugs        | http://www.drug-testing-detox.com     | Access denied | PC             | 5              |
      | use-same-apn    | Violence-Suicide     | http://101.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Marijuana            | http://104.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Hate-Slander         | http://kkk.com                        | Access denied | PC             | 5              |
      | use-same-apn    | Fetish               | http://1505.incompass.netstar-inc.com | Access denied | PC             | 5              |
      | use-same-apn    | Sexual-Services      | http://303.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | mvne1-func-epg1 | Hacking-Cracking     | http://401.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Remote-Proxies       | http://403.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Illegal-Drugs        | http://102.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Violence-Suicide     | http://fakepassport.info              | Access denied | PC             | 5              |
      | use-same-apn    | Terrorism-Extremists | http:/201.incompass.netstar-inc.com   | Access denied | PC             | 5              |
      | use-same-apn    | Fetish               | https://fetlife.com                   | Access denied | PC             | 5              |
      | use-same-apn    | Adult-SearchLinks    | http://304.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | tesco-func-epg1 | Remote-Proxies       | http://anonymizer.com                 | Access denied | PC             | 5              |
      | use-same-apn    | Marijuana            | http://www.marijuana.com              | Access denied | PC             | 5              |
      | use-same-apn    | Pornography          | http://301.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Terrorism-Extremists | http://www.terroristwebsites.info     | Access denied | PC             | 5              |
      | use-same-apn    | Hate-Slander         | http://203.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Sexual-Services      | http://www.companionsescorts.com      | Access denied | PC             | 5              |
      | use-same-apn    | Adult-SearchLinks    | http://boodigo.com                    | Access denied | PC             | 5              |

  @cf_nds_cat_serv

  Scenario Outline: Block when user browse item from NDS blocked category using <apn> with device profile <device_profile>
    Given Android device using "<device_profile>" select apn "<apn>" and wait for "<data_conn_wait>" sec
     When Network connection status is "Data" collect device information
     Then Data can be downloaded for "<device_profile>" subscriber with network type "LTE"
      And Open "chrome" browser and get url "<url>"
      And if url in "<nds_cat>" then user is blocked or redirected to page with "<content>" inside page
    Examples:
      | apn             | nds_cat              | url                                   | content       | device_profile | data_conn_wait |
      | idata-serv-epg1 | Hacking-Cracking     | http://mirror-h.org                   | Access denied | NDS            | 5              |
      | use-same-apn    | Illegal-Drugs        | http://www.drug-testing-detox.com     | Access denied | NDS            | 5              |
      | use-same-apn    | Marijuana            | http://104.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Fetish               | http://1505.incompass.netstar-inc.com | Access denied | NDS            | 5              |
      | use-same-apn    | Violence-Suicide     | http://101.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Hate-Slander         | http://kkk.com                        | Access denied | NDS            | 5              |
      | use-same-apn    | Sexual-Services      | http://303.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | mvne1-serv-epg2 | Adult-SearchLinks    | http://304.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Hacking-Cracking     | http://401.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Remote-Proxies       | http://403.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Illegal-Drugs        | http://102.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Violence-Suicide     | http://fakepassport.info              | Access denied | NDS            | 5              |
      | use-same-apn    | Terrorism-Extremists | http:/201.incompass.netstar-inc.com   | Access denied | NDS            | 5              |
      | use-same-apn    | Fetish               | https://fetlife.com                   | Access denied | NDS            | 5              |
      | tesco-serv-epg1 | Remote-Proxies       | http://anonymizer.com                 | Access denied | NDS            | 5              |
      | use-same-apn    | Hate-Slander         | http://203.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Terrorism-Extremists | http://www.terroristwebsites.info     | Access denied | NDS            | 5              |
      | use-same-apn    | Marijuana            | http://www.marijuana.com              | Access denied | NDS            | 5              |
      | use-same-apn    | Pornography          | http://301.incompass.netstar-inc.com  | Access denied | NDS            | 5              |
      | use-same-apn    | Sexual-Services      | http://www.companionsescorts.com      | Access denied | NDS            | 5              |
      | use-same-apn    | Adult-SearchLinks    | http://boodigo.com                    | Access denied | NDS            | 5              |
      | idata-serv-epg2 | Hacking-Cracking     | http://mirror-h.org                   | Access denied | PC             | 5              |
      | use-same-apn    | Illegal-Drugs        | http://www.drug-testing-detox.com     | Access denied | PC             | 5              |
      | use-same-apn    | Violence-Suicide     | http://101.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Marijuana            | http://104.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Hate-Slander         | http://kkk.com                        | Access denied | PC             | 5              |
      | use-same-apn    | Fetish               | http://1505.incompass.netstar-inc.com | Access denied | PC             | 5              |
      | use-same-apn    | Sexual-Services      | http://303.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | mvne1-serv-epg1 | Hacking-Cracking     | http://401.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Remote-Proxies       | http://403.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Illegal-Drugs        | http://102.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Violence-Suicide     | http://fakepassport.info              | Access denied | PC             | 5              |
      | use-same-apn    | Terrorism-Extremists | http:/201.incompass.netstar-inc.com   | Access denied | PC             | 5              |
      | use-same-apn    | Fetish               | https://fetlife.com                   | Access denied | PC             | 5              |
      | use-same-apn    | Adult-SearchLinks    | http://304.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | tesco-serv-epg1 | Remote-Proxies       | http://anonymizer.com                 | Access denied | PC             | 5              |
      | use-same-apn    | Marijuana            | http://www.marijuana.com              | Access denied | PC             | 5              |
      | use-same-apn    | Pornography          | http://301.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Terrorism-Extremists | http://www.terroristwebsites.info     | Access denied | PC             | 5              |
      | use-same-apn    | Hate-Slander         | http://203.incompass.netstar-inc.com  | Access denied | PC             | 5              |
      | use-same-apn    | Sexual-Services      | http://www.companionsescorts.com      | Access denied | PC             | 5              |
      | use-same-apn    | Adult-SearchLinks    | http://boodigo.com                    | Access denied | PC             | 5              |