Feature: Get links from web page

Scenario: Get links from web page
    Given Open chrome browser and get url "https://www.grunenthal.com"
     Then print links from page
