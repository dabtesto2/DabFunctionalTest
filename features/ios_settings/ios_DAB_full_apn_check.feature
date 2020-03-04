  Feature: Configure iOS settings

  Scenario Outline: Check DABFULL Apn on iOS device <model> for <username>
    Given Launch ios Settings for "<model>" with "<apn>" "<username>" "<password>" "<time_wait>"
      And Open safari browser get url "<url>" using "<model>"
    Examples:
      | apn           | username                     | password | time_wait | model   | url                          |
      | dab.test.apn1 | dabfull@idata.dabfull.ref    | password | 1         | iphone8 | https://www-dev-1.full.verity.ref.o2.co.uk |
      | dab.test.apn1 | dabfull@idata.dabfull.ref    | password | 1         | iphone8 | https://www-dev-1.full-cn-only.verity.ref.o2.co.uk|
      | dab.test.apn1 | dabfull@idata.dabfull.ref    | password | 1         | iphone8 | https://www-dev-1.full-san-only.verity.ref.o2.co.uk|
      | dab.test.apn1 | dabfull@idata.dabfull.ref    | password | 1         | iphone8 | https://www-dev-1.full-nocn-nosan.verity.ref.o2.co.uk|
