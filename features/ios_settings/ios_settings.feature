  Feature: Configure iOS settings

  Scenario Outline: Configure iOS settings
    Given Launch ios Settings for "<model>" with "<apn>" "<username>" "<password>" "<time_wait>"
      And Open safari browser get url "<url>" using "<model>"
    Examples:
      | apn           | username                     | password | time_wait | model   | url                   |
      | dab.test.apn1 | dabfull@idata.dabfull.ref    | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn1 | dabfull@mobile.dabfull.ref   | password | 5         | iphone8 | https://www.ebay.co.uk|
