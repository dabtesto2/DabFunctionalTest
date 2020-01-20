Feature: Get links from web page

  Scenario: Get links from web page
    Given Open chrome browser get url "https://www.grunenthal.com" using "s8"
    Then print links from chrome page
