Feature: Add APN to device with NDS profile

  Scenario Outline: Add APN to device with NDS profile <apn_n>
    Given Add APN "<apn_n>" "<apn>" "<user>" "<passwd>" "<mmsc>" "<mmsc_proxy>" "<mms_port>" "<proxy>" "<port>" "NDS" profile

    Examples: Add APN
      | apn_n                       | apn           | user                         | passwd   | mmsc                                            | mmsc_proxy   | mms_port | proxy          | port  |
      | idata-full-epg1             | dab.test.apn1 | dabfull@idata.dabfull.ref    | password | http://mmsc-ac.mms.test.ref.o2.co.uk:10021/mmsc | 82.132.144.1 |     8080 | empty          | empty |
      | mobile-full-epg2            | dab.test.apn2 | dabfull@mobile.dabfull.ref   | password | http://mmsc-ac.mms.test.ref.o2.co.uk:10021/mmsc | 82.132.144.1 |     8080 | empty          | empty |
      | idata-full-vepg-2           | dab.test.apn3 | dabfull@idata.dabfull.ref    | password | http://mmsc-ac.mms.test.ref.o2.co.uk:10021/mmsc | 82.132.144.1 |     8080 | empty          | empty |
