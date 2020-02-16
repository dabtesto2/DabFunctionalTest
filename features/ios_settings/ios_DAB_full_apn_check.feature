  Feature: Configure iOS settings

  Scenario Outline: Configure iOS settings
    Given Launch ios Settings for "<model>" with "<apn>" "<username>" "<password>" "<time_wait>"
      And Open safari browser get url "<url>" using "<model>"
    Examples:
      | apn           | username                     | password | time_wait | model   | url                   |
      | dab.test.apn1 | dabfull@idata.dabfull.ref    | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn1 | dabfull@mobile.dabfull.ref   | password | 5         | iphone8 | https://www.ebay.co.uk|
      | dab.test.apn1 | dabfull@ibrowse.dabfull.ref  | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn1 | dabfull@m-bb.dabfull.ref     | password | 5         | iphone8 | https://www.ebay.co.uk |
      | dab.test.apn1 | dabfull@isetup.dabfull.ref   | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn1 | dabfull@modem.dabfull.ref    | password | 5         | iphone8 | https://www.ebay.co.uk|
      | dab.test.apn1 | dabfull@mvne1.dabfull.ref    | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn1 | dabfull@tesco.dabfull.ref    | password | 5         | iphone8 | https://www.ebay.co.uk |
      | dab.test.apn1 | dabfull@payandgo.dabfull.ref | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn1 | dabfull@wap.dabfull.ref      | password | 5         | iphone8 | https://www.ebay.co.uk |
      | dab.test.apn1 | dabfull@vpn.dabfull.ref      | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn2 | dabfull@idata.dabfull.ref    | password | 5         | iphone8 | https://www.ebay.co.uk |
      | dab.test.apn2 | dabfull@mobile.dabfull.ref   | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn2 | dabfull@ibrowse.dabfull.ref  | password | 5         | iphone8 | https://www.ebay.co.uk |
      | dab.test.apn2 | dabfull@m-bb.dabfull.ref     | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn2 | dabfull@isetup.dabfull.ref   | password | 5         | iphone8 | https://www.ebay.co.uk |
      | dab.test.apn2 | dabfull@modem.dabfull.ref    | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn2 | dabfull@mvne1.dabfull.ref    | password | 5         | iphone8 | https://www.ebay.co.uk |
      | dab.test.apn2 | dabfull@tesco.dabfull.ref    | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn2 | dabfull@payandgo.dabfull.ref | password | 5         | iphone8 | https://www.ebay.co.uk |
      | dab.test.apn2 | dabfull@wap.dabfull.ref      | password | 5         | iphone8 | https://www.bbc.co.uk |
      | dab.test.apn2 | dabfull@vpn.dabfull.ref      | password | 5         | iphone8 | https://www.ebay.co.uk |