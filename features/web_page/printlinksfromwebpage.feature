@web_page_setup
Feature: print links from web page

  Scenario Outline : print links from page https://www.grunenthal.com
    Then print links from page
    Examples:
      | link                                               |
      | https://www.grunenthal.com/en/footer-links/contact |
