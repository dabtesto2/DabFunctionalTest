Feature: Get links from web page

  Scenario: Get links from web page
    Given Open safari browser get url "https://www.grunenthal.com" using "8d0a9f6c8218eaa1356fdf3e4e08573d1228ae3a"
    Then print links from safari page
