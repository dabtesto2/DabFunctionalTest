Feature: Test the web page

Scenario Outline: Test the web page
    And Open chrome browser and get url "<url>"
    And Check if page loads with "<title>" and click "<no_links>" links
    Examples:
       | url                        | title | no_links |
       | https://www.grunenthal.com |  grun |    70    |