from selenium.common.exceptions import StaleElementReferenceException
from iospages.AppiumClientLocal import AppiumClientLocal
from appium import webdriver


class SafariPage:
    def __init__(self, device_profile, timeout=10):
        self.safari_driver_timeout = timeout
        self.html_links = []
        self.platform = "iOS"
        self.version = "13"
        self.browser = "Safari"
        self.device_id = device_profile
        client = AppiumClientLocal()
        desired_caps = dict(automationName=client.name, platformName=self.platform, browserName=self.browser,
                            udid=self.device_id, deviceName=self.platform, platformVersion=self.version
                            )
        self.driver = webdriver.Remote(client.get_remote_url(), desired_caps)
        #self.driver.implicitly_wait(self.safari_driver_timeout)

    def get_web_page_using_safari_browser(self, url):
        try:
            self.driver.get(url)
        except Exception as error:
            print("SafariPage exception at get_web_page_using_safari_browser " + str(error))

    def safari_find_element_containing_text_and_click(self, search_string):
        try:
            element = self.driver.find_elements_by_xpath("//*[contains(text(), '" + search_string + "')]")
            for elem in element:
                elem.click()
        except Exception as error:
            print("Selenium exception in safari_find_element_containing_text_and_click " + str(error))

    def print_links_from_safari_page(self):
        try:
            elements = self.driver.find_elements_by_tag_name("a")
            for items in elements:
                if items.text is not None:
                    print("|" + items.get_attribute("href") + "|" + items.text + "|")
        except StaleElementReferenceException:
            pass
        except Exception as error:
            print("Chromedriver exception at print_links_from_page " + str(error))
