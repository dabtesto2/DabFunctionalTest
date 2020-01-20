Feature: Get links from web page

  Scenario: Get links from web page
    Given Open safari browser get url "https://www.grunenthal.com" using "caecc423e608824f597d8a3dbc382b3addc0382f"
    Then print links from safari page
