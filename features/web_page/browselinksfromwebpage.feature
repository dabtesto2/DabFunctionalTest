@web_page_setup
Feature: Get links from web page

  Scenario Outline: Open page https://www.grunenthal.com
    Then Check if page loads with "<link>"
    Examples:
      | link                                                                                             |
      | https://www.grunenthal.com/#                                                                     |