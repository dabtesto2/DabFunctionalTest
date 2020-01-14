  @web_page_safari_setup
  Feature: Get links from web page
  Scenario Outline: Open page https://www.grunenthal.com using safari browser
     Then Check if safari page loads with "<link>"
    Examples:
      | link                                                                                             |
  |https://www.grunenthal.com/en/r-d-vision-mission/pipeline|
|https://www.grunenthal.com/en/r-d-vision-mission/strategy|
|https://www.grunenthal.com/en/r-d-vision-mission|
|https://www.grunenthal.com/en|