from selenium.common.exceptions import StaleElementReferenceException, TimeoutException
from selenium.webdriver.support.wait import WebDriverWait

from iospages.AppiumClientLocal import AppiumClientLocal
from appium import webdriver


class SafariPage:
    def __init__(self, device_profile, timeout=10):
        self.safari_driver_timeout = timeout
        self.html_links = []
        self.platform = "iOS"
        self.version = "9.3"
        self.browser = "Safari"
        self.device_id = device_profile
        client = AppiumClientLocal()
        desired_caps = dict(automationName=client.name, platformName=self.platform, browserName=self.browser,
                            udid=self.device_id, deviceName=self.platform, platformVersion=self.version,
                            startIWDP="true"
                            )
        self.driver = webdriver.Remote(client.get_remote_url(), desired_caps)
        self.driver.implicitly_wait(self.safari_driver_timeout)

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
                    print("|" + items.get_attribute("href") + "|")
        except StaleElementReferenceException:
            pass
        except Exception as error:
            print("SafariPage exception at print_links_from_page " + str(error))

    def check_safari_document_ready_state(self, title):
        try:
            WebDriverWait(self.driver, self.safari_driver_timeout).until(
                lambda driver: self.driver.execute_script('return document.readyState') == 'complete')
        except TimeoutException:
            raise ValueError(f' {title} Web Page did not load in {self.safari_driver_timeout} seconds')

    def click_link_on_safari_page(self, link):
        try:
            self.driver.get(link)
        except Exception as error:
            print("SafariPage exception during click_link_on_page " + str(error))

    def get_safari_page_height(self):
        try:
            return self.driver.execute_script("return document.body.scrollHeight")
        except Exception as error:
            print("Selenium exception in get_safari_page_height " + str(error))

    def safari_scroll_to_page(self, x_position, y_position):
        try:
            self.driver.execute_script("window.scrollTo({},{});".format(x_position, y_position))
        except Exception as error:
            print("Selenium exception in safari_scroll_to_page " + str(error))

    def save_safari_web_page_screenshot(self):
        try:
            return self.driver.get_screenshot_as_png()
        except Exception as error:
            print("SafariPage exception at save_safari_web_page_screenshot " + str(error))
