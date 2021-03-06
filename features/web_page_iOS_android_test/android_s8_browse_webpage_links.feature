    @android_s8_web_page_chrome_setup
  Feature: Get links from web page
  Scenario Outline: Open page https://www.grunenthal.com using chrome browser
     Then Check if chrome page loads with "<link>"
    Examples:
      | link                                                                                             |
      | https://www.grunenthal.com/#cd-primary-nav                                                       |
      | https://www.grunenthal.com/#cd-search                                                            |
      | https://www.grunenthal.com/#search-box                                                           |
      | https://www.grunenthal.com/#                                                                     |
      | https://www.grunenthal.com/en/about-us/company-overview                                          |
      | https://www.grunenthal.com/en/about-us/global-capabilities/affiliates-europe                     |
      | https://www.grunenthal.com/en/about-us/global-capabilities/affiliates-usa-latin-america          |
      | https://www.grunenthal.com/en/about-us/global-capabilities/manufacturing-sites                   |
      | https://www.grunenthal.com/en/about-us/global-capabilities                                       |
      | https://www.grunenthal.com/en/about-us/history                                                   |
      | https://www.grunenthal.com/en/about-us/initiatives                                               |
      | https://www.grunenthal.com/en/about-us/leadership/fabian-raschke                                 |
      | https://www.grunenthal.com/en/about-us/leadership/g-baertschi                                    |
      | https://www.grunenthal.com/en/about-us/leadership/jan-adams                                      |
      | https://www.grunenthal.com/en/about-us/leadership/m-fladrich                                     |
      | https://www.grunenthal.com/en/about-us/leadership                                                |
      | https://www.grunenthal.com/en/about-us/our_positions                                             |
      | https://www.grunenthal.com/en/about-us/products                                                  |
      | https://www.grunenthal.com/en/about-us/responsibility/compliance                                 |
      | https://www.grunenthal.com/en/about-us/responsibility/environmental-protection                   |
      | https://www.grunenthal.com/en/about-us/responsibility/social-responsibility                      |
      | https://www.grunenthal.com/en/about-us/responsibility/thalidomide-our-responsibility-today       |
      | https://www.grunenthal.com/en/about-us/responsibility                                            |
      | https://www.grunenthal.com/en/about-us/supervisory-board                                         |
      | https://www.grunenthal.com/en/about-us                                                           |
      | https://www.grunenthal.com/en/footer-links/contact                                               |
      | https://www.grunenthal.com/en/footer-links/disclaimer                                            |
      | https://www.grunenthal.com/en/footer-links/general-terms-and-conditions                          |
      | https://www.grunenthal.com/en/footer-links/imprint                                               |
      | https://www.grunenthal.com/en/footer-links/privacy-statement-hcp                                 |
      | https://www.grunenthal.com/en/footer-links/privacy-statement                                     |
      | https://www.grunenthal.com/en/footer-links/sitemap                                               |
      | https://www.grunenthal.com/en/jobs-and-career/meet-our-people/employee-story--siegfried-ebner    |
      | https://www.grunenthal.com/en/jobs-and-career/meet-our-people/employee-story-corinne-pala        |
      | https://www.grunenthal.com/en/jobs-and-career/meet-our-people/employee-story-katrin-fleischer    |
      | https://www.grunenthal.com/en/jobs-and-career/meet-our-people                                    |
      | https://www.grunenthal.com/en/jobs-and-career/we-are-gruenenthal                                 |
      | https://www.grunenthal.com/en/jobs-and-career                                                    |
      | https://www.grunenthal.com/en/partnering/areas-of-interest                                       |
      | https://www.grunenthal.com/en/partnering/partnerships-and-collaborations-grants/grants-dual2pet  |
      | https://www.grunenthal.com/en/partnering/partnerships-and-collaborations-grants/grants-neuroweg  |
      | https://www.grunenthal.com/en/partnering/partnerships-and-collaborations-grants/grants-painvis   |
      | https://www.grunenthal.com/en/partnering/partnerships-and-collaborations-grants                  |
      | https://www.grunenthal.com/en/partnering/partnerships-and-collaborations-ppp                     |
      | https://www.grunenthal.com/en/partnering                                                         |
      | https://www.grunenthal.com/en/press-room/corporate-publications                                  |
      | https://www.grunenthal.com/en/press-room/medical-press-releases/2013-press-releases              |
      | https://www.grunenthal.com/en/press-room/medical-press-releases/2014-press-releases              |
      | https://www.grunenthal.com/en/press-room/medical-press-releases/2015-press-releases              |
      | https://www.grunenthal.com/en/press-room/medical-press-releases/2016-press-releases              |
      | https://www.grunenthal.com/en/press-room/medical-press-releases/2017-press-releases              |
      | https://www.grunenthal.com/en/press-room/medical-press-releases/2018-press-releases              |
      | https://www.grunenthal.com/en/press-room/medical-press-releases/2019-press-releases              |
      | https://www.grunenthal.com/en/press-room/medical-press-releases                                  |
      | https://www.grunenthal.com/en/press-room/resources-image                                         |
      | https://www.grunenthal.com/en/press-room/resources-video                                         |
      | https://www.grunenthal.com/en/press-room/statements                                              |
      | https://www.grunenthal.com/en/press-room/stories?categoryFilter=Collaboration                    |
      | https://www.grunenthal.com/en/press-room/stories?categoryFilter=Contract%20Manufacturing         |
      | https://www.grunenthal.com/en/press-room/stories?categoryFilter=Events                           |
      | https://www.grunenthal.com/en/press-room/stories?categoryFilter=Latin%20America                  |
      | https://www.grunenthal.com/en/press-room/stories?categoryFilter=Pain                             |
      | https://www.grunenthal.com/en/press-room/stories?categoryFilter=Patients                         |
      | https://www.grunenthal.com/en/press-room/stories?categoryFilter=People                           |
      | https://www.grunenthal.com/en/press-room/stories?categoryFilter=Research                         |
      | https://www.grunenthal.com/en/press-room/stories?categoryFilter=Social%20Responsibility          |
      | https://www.grunenthal.com/en/press-room/stories                                                 |
      | https://www.grunenthal.com/en/press-room/view-story?storyId=1291a9f3-0fb9-411d-97d0-58444c4b4099 |
      | https://www.grunenthal.com/en/press-room/view-story?storyId=3c4b03ca-48af-4907-aa68-01b1f66ed8ed |
      | https://www.grunenthal.com/en/press-room/view-story?storyId=79ee1399-e265-4e4d-93d2-111d8a630799 |
      | https://www.grunenthal.com/en/press-room/view-story?storyId=ae00ca51-a42c-480c-9040-7e13cd104777 |
      | https://www.grunenthal.com/en/press-room/view-story?storyId=beb7d2f0-d695-4737-9c7f-619b3c696889 |
      | https://www.grunenthal.com/en/press-room/view-story?storyId=c5d43378-d8d7-4f83-814c-f09a2d0df2df |
      | https://www.grunenthal.com/en/press-room/view-story?storyId=dc7264c1-bb95-4295-a14c-4af5c833cea6 |
      | https://www.grunenthal.com/en/press-room/view-story?storyId=e557647f-cc0c-4064-b06f-a3d570235d40 |
      | https://www.grunenthal.com/en/press-room/view-story?storyId=fdbff48f-80b9-48be-b7a0-1f2ef7be27be |
      | https://www.grunenthal.com/en/press-room                                                         |
      | https://www.grunenthal.com/en/r-d-vision-mission/clinical-trials/data-clinical-trials            |
      | https://www.grunenthal.com/en/r-d-vision-mission/clinical-trials/data-sharing-clinical-trials    |
      | https://www.grunenthal.com/en/r-d-vision-mission/clinical-trials                                 |
      | https://www.grunenthal.com/en/r-d-vision-mission/collaborate/our-capabilities                    |
      | https://www.grunenthal.com/en/r-d-vision-mission/collaborate                                     |
      | https://www.grunenthal.com/en/r-d-vision-mission/focus-pain                                      |
      | https://www.grunenthal.com/en/r-d-vision-mission/pipeline                                        |
      | https://www.grunenthal.com/en/r-d-vision-mission/strategy                                        |
      | https://www.grunenthal.com/en/r-d-vision-mission                                                 |
      | https://www.grunenthal.com/en                                                                    |