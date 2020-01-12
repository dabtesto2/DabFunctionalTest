  @web_page_setup
  Feature: Get links from web page
  Scenario Outline: Open page https://www.grunenthal.com
     Then Check if page loads with "<link>"
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