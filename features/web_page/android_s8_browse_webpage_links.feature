  @web_page_chrome_setup
  Feature: Get links from web page
  Scenario Outline: Open page https://www.grunenthal.com using chrome browser
     Then Check if chrome page loads with "<link>"
    Examples:
      | link                                                                                             |
      | https://www.grunenthal.com/en/about-us                                                           |