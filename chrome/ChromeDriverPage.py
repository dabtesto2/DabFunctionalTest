import os
import time
from random import randint

from appium import webdriver
from selenium.common.exceptions import InvalidSessionIdException, TimeoutException
from selenium.webdriver.support.wait import WebDriverWait

from androidpages.AppiumClientLocal import AppiumClientLocal


class ChromeDriverPage:
    def __init__(self, device_profile, timeout=10):
        self.chrome_driver_timeout = timeout
        self.html_links = []
        self.platform = "Android"
        self.browser = "Chrome"
        self.device_id = device_profile
        self.chromedriverExecutable = "/Users/purush/chromedriver/"
        self.chromedriverVersion = 78
        self.result_directory = '%s/screenshot/' % os.getcwd()
        self.screen_page_name = 'chrome-screen'
        self.chromedriverpath = self.chromedriverExecutable + str(self.chromedriverVersion) + "/chromedriver"
        client = AppiumClientLocal()
        desired_caps = dict(automationName=client.name, platformName=self.platform, browserName=self.browser,
                            udid=self.device_id, deviceName=self.platform, chromedriverExecutable=self.chromedriverpath
                            )
        self.driver = webdriver.Remote(client.get_remote_url(), desired_caps)
        self.driver.implicitly_wait(self.chrome_driver_timeout)

    def __del__(self):
        try:
            if self.driver.session:
                self.driver.quit()
        except InvalidSessionIdException:
            pass

    def save_chrome_web_page_screenshot(self):
        self.driver.save_screenshot(self.result_directory + self.screen_page_name + str(time.time_ns()) + ".png")

    def get_web_page_using_chrome_browser(self, url):
        self.driver.get(url)

    def get_web_page_title(self):
        title = self.driver.title
        return title.lower()

    def get_web_page_source(self):
        page_source = self.driver.page_source
        return page_source.lower()

    def set_chrome_wait(self, seconds):
        time.sleep(seconds)

    def get_links_from_page(self):
        elements = self.driver.find_elements_by_xpath("//a[@href]")
        for items in elements:
            self.html_links.append(items.get_attribute("href"))

    def click_links_from_page(self, no_links):
        while no_links > 0:
            try:
                self.driver.get(self.html_links.pop(randint(0, (len(self.html_links) - 1))))
                no_links -= 1
            except Exception as error:
                print("Selenium exception during click_links_from_page " + str(error))

    def check_document_ready_state(self, title):
        try:
            WebDriverWait(self.driver, self.chrome_driver_timeout).until(
                lambda driver: self.driver.execute_script('return document.readyState') == 'complete')
        except TimeoutException:
            raise ValueError(f' {title} Web Page did not load in {self.chrome_driver_timeout} seconds')
