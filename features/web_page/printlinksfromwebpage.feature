Feature: Get links from web page

  Scenario  : Get links from web page
    Given Open chrome browser get url "https://www.grunenthal.com" using "ce071717ab7bd73901"
    Then print links from page
