import time
from random import randint
from selenium.webdriver import ChromeOptions
from appium import webdriver
from selenium.common.exceptions import InvalidSessionIdException, TimeoutException, StaleElementReferenceException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
import re
from androidpages.AppiumClientLocal import AppiumClientLocal
from selenium.webdriver.support import expected_conditions as ec

from androidpages.Locators import MessageBox
from androidpages.Locators import chromepage


class ChromeDriverPage:
    def __init__(self, device_id, timeout=10):
        self.chrome_driver_timeout = timeout
        self.html_links = []
        self.platform = "Android"
        self.browser = "Chrome"
        self.device_id = device_id
        self.chromedriverExecutable = "/Users/purushothamanloganathan/chromedriver/"
        self.chromedriverVersion = 99
        self.chromedriverpath = self.chromedriverExecutable + str(self.chromedriverVersion) + "/chromedriver"
        client = AppiumClientLocal()
        options = ChromeOptions()
        options.add_experimental_option('w3c', False)
        desired_caps = dict(automationName=client.name, platformName=self.platform, browserName=self.browser,
                            udid=self.device_id, deviceName=self.platform, chromedriverExecutable=self.chromedriverpath
                            )
        self.driver = webdriver.Remote(client.get_remote_url(), desired_caps)
        self.driver.implicitly_wait(self.chrome_driver_timeout)

    def __del__(self):
        try:
            if self.driver.session_id:
                self.driver.quit()
        except InvalidSessionIdException:
            pass

    def save_chrome_web_page_screenshot(self):
        try:
            return self.driver.get_screenshot_as_png()
        except Exception as error:
            print("Chromedriver exception at save_chrome_web_page_screenshot " + str(error))

    def get_web_page_using_chrome_browser(self, url):
        try:
            self.driver.get(url)
        except Exception as error:
            print("Chromedriver exception at get_web_page_using_chrome_browser " + str(error))

    def get_web_page_title(self):
        try:
            title = self.driver.title
            return title.lower()
        except Exception as error:
            print("Chromedriver exception at get_web_page_title " + str(error))

    def get_web_page_source(self):
        try:
            page_source = self.driver.page_source
            return page_source.lower()
        except Exception as error:
            print("Chromedriver exception at get_web_page_source " + str(error))

    def set_chrome_wait(self, seconds):
        try:
            time.sleep(seconds)
        except Exception as error:
            print("Chromedriver exception at set_chrome_wait " + str(error))

    def get_links_from_page(self):
        try:
            elements = self.driver.find_elements_by_xpath(chromepage.DynamicLinks[1])
            for items in elements:
                self.html_links.append(items.get_attribute("href"))
        except StaleElementReferenceException:
            pass
        except Exception as error:
            print("Chromedriver exception at get_links_from_page " + str(error))

    def click_links_from_page(self, no_links):
        try:
            while no_links > 0:
                try:
                    self.dismiss_message_box_if_any()
                    if len(self.html_links) > 0:
                        link_name = self.html_links.pop(randint(0, (len(self.html_links) - 1)))
                        self.driver.get(link_name)
                    else:
                        print("No Links found in Page")
                        break
                    no_links -= 1
                except Exception as error:
                    print("Chromedriver exception during click_links_from_page " + str(error))
        except Exception as error:
            print("Chromedriver exception at click_links_from_page " + str(error))

    def check_document_ready_state(self, title):
        try:
            WebDriverWait(self.driver, self.chrome_driver_timeout).until(
                lambda driver: self.driver.execute_script('return document.readyState') == 'complete')
        except TimeoutException:
            raise ValueError(f' {title} Web Page did not load in {self.chrome_driver_timeout} seconds')

    def dismiss_message_box_if_any(self):
        try:
            wait = WebDriverWait(self.driver, (self.chrome_driver_timeout / self.chrome_driver_timeout))
            by_locator = MessageBox.dismiss_alert
            element = wait.until(ec.element_to_be_clickable((by_locator[0], by_locator[1])))
            element.click()
        except TimeoutException:
            pass

    def check_for_reload_button_in_chrome_page(self):
        try:
            element = self.driver.find_elements_by_xpath(chromepage.ChromePageErrorBtnReload[1])
            if element:
                return True
        except Exception as error:
            print("Chromedriver exception at check_for_reload_button_in_chrome_page " + str(error))

    def check_for_details_button_in_chrome_page(self):
        try:
            element = self.driver.find_elements_by_xpath(chromepage.ChromePageErrorBtnDetails[1])
            if element:
                return True
        except Exception as error:
            print("Chromedriver exception at check_for_details_button_in_chrome_page " + str(error))

    def check_for_chrome_page_timeout(self):
        try:
            value = re.findall(r"err\_timed\_out", self.get_web_page_source())
            if len(value):
                return str(value[0])
            else:
                return "None"
        except Exception as error:
            print("Chromedriver exception at check_for_chrome_page_timeout " + str(error))

    def check_for_chrome_page_connection_reset(self):
        try:
            value = re.findall(r"err\_connection\_reset", self.get_web_page_source())
            if len(value):
                return str(value[0])
            else:
                return "None"
        except Exception as error:
            print("Chromedriver exception at check_for_chrome_page_connection_reset " + str(error))

    def check_for_chrome_page_content_decoding_failed(self):
        try:
            value = re.findall(r"err\_content\_decoding\_failed", self.get_web_page_source())
            if len(value):
                return str(value[0])
            else:
                return "None"
        except Exception as error:
            print("Chromedriver exception at check_for_chrome_page_connection_reset " + str(error))

    def check_for_chrome_page_access_denied(self):
        try:
            if len(re.findall(r"access denied", self.get_web_page_source())):
                value = re.findall(r"access denied", self.get_web_page_source())
                return str(value[0])
            elif len(re.findall(r"over-18s", self.get_web_page_source())):
                value = re.findall(r"over-18s", self.get_web_page_source())
                return str(value[0])
            elif len(re.findall(r"under 18", self.get_web_page_source())):
                value = re.findall(r"under 18", self.get_web_page_source())
                return str(value[0])
            elif len(re.findall(r"over 18", self.get_web_page_source())):
                value = re.findall(r"over 18", self.get_web_page_source())
                return str(value[0])
            elif len(re.findall(r"parental control", self.get_web_page_source())):
                value = re.findall(r"parental control", self.get_web_page_source())
                return str(value[0])
            elif len(re.findall(r"site to be blocked", self.get_web_page_source())):
                value = re.findall(r"site to be blocked", self.get_web_page_source())
                return str(value[0])
            else:
                return "None"
        except Exception as error:
            print("Chromedriver exception at check_for_chrome_page_access_denied " + str(error))

    def print_links_from_chrome_page(self):
        try:
            elements = self.driver.find_elements_by_tag_name("a")
             #elements = self.driver.find_elements_by_xpath(chromepage.DynamicLinks[1])
            for items in elements:
                if items.text is not None:
                    print("|" + items.get_attribute("href") + "|")
        except StaleElementReferenceException:
            pass
        except Exception as error:
            print("Chromedriver exception at print_links_from_page " + str(error))

    def click_link_on_page(self, link):
        try:
            self.dismiss_message_box_if_any()
            self.driver.get(link)
        except Exception as error:
            print("Chromedriver exception during click_link_on_page " + str(error))

    def get_page_height(self):
        try:
            return self.driver.execute_script("return document.body.scrollHeight")
        except Exception as error:
            print("Selenium exception in get_page_height " + str(error))

    def chrome_find_element_containing_text_and_click(self, search_string):
        try:
            element = self.driver.find_elements_by_xpath("//*[contains(text(), '" + search_string + "')]")
            for elem in element:
                elem.click()
        except Exception as error:
            print("Selenium exception in chrome_find_element_containing_text_and_click " + str(error))

    def chrome_find_element_containing_text_and_play(self):
        try:
            #xpath = "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.webkit.WebView/android.view.View/android.view.View/android.view.View[2]/android.widget.Button"
            #element = self.driver.find_elements_by_xpath("//*[contains(text(), 'play')]")
            element = self.driver.find_elements_by_xpath("//button[contains(text(),'play')]")
            #self.driver.find_element_by_xpath(xpath).click()
            for elem in element:
                elem.click()
        except Exception as error:
            print("Selenium exception in chrome_find_element_containing_text_and_play " + str(error))

    def chrome_scroll_to_page(self, x_position, y_position):
        try:
            self.driver.execute_script("window.scrollTo({},{});".format(x_position, y_position))
        except Exception as error:
            print("Selenium exception in chrome_scroll_to_page " + str(error))

    def chrome_fb_login(self, url, user, password, seconds):
        try:
            self.driver.get(url)
            time.sleep(10)
            username_box = self.driver.find_element_by_id('m_login_email')
            username_box.send_keys(user)
            time.sleep(5)
            password_box = self.driver.find_element_by_id('m_login_password')
            password_box.send_keys(password)
            time.sleep(5)
            login_box = self.driver.find_element_by_xpath('//button[@name="Log In"]')
            login_box[0].click()
            time.sleep(int(seconds/3))
        except Exception as error:
            print("Selenium exception in chrome_fb_login " + str(error))


    def chrome_click_play(self):
        try:
            play_button = self.driver.find_element_by_xpath("//android.widget.Button[@text='play']")
            for elem in play_button:
                print(" ***** Element is {}".format(elem.text))

        except Exception as error:
            print("Selenium exception in chrome_click_play_button " + str(error))
