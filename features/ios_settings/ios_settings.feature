  Feature: Configure iOS settings

  Scenario Outline: Configure iOS settings
    Given Launch ios Settings for "iphone8" with "<apn>" "<username>" "<password>" "<time_wait>"
    Examples:
      | apn           | username                  | password | time_wait |
      | dab.test.apn1 | dabfull@idata.dabfull.ref | password |    5      |