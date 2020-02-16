  Feature: Configure iOS settings

  Scenario Outline: Check DABFULL Apn on iOS device <model> for <username>
    Given Launch ios Settings for "<model>" with "<apn>" "<username>" "<password>" "<time_wait>"
      And Open safari browser get url "<url>" using "<model>"
    Examples:
      | apn           | username                     | password | time_wait | model   | url                   |
      | dab.test.apn1 | dabfull@idata.dabfull.ref    | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@mobile.dabfull.ref   | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@ibrowse.dabfull.ref  | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@m-bb.dabfull.ref     | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@isetup.dabfull.ref   | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@modem.dabfull.ref    | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@mvne1.dabfull.ref    | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@tesco.dabfull.ref    | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@payandgo.dabfull.ref | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@wap.dabfull.ref      | password | 1         | iphone8 | http://www.xhaus.com/headers |
      | dab.test.apn1 | dabfull@vpn.dabfull.ref      | password | 1         | iphone8 | http://www.xhaus.com/headers |
