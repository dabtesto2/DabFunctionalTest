import os
from selenium.common.exceptions import InvalidSessionIdException
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as ec
from androidpages.AndroidDevicePool import AndroidDevicePool
from androidpages.AndroidInternals import AndroidNetworkConnection
from androidpages.AndroidInternals import AndroidKeys
from selenium.webdriver.remote import command

from androidpages.AndroidTestPluginApp import AndroidTestPluginApp
from androidpages.AppiumClientLocal import AppiumClientLocal
from appium import webdriver
import time
from urllib3.exceptions import NewConnectionError, MaxRetryError


class BasePage(AndroidTestPluginApp):
    """
    This class is the parent class for Android Device class and use selenium web driver class
    """

    # this function is called every time a new object of the base class is created.
    def __init__(self, device_profile, timeout=5):

        android = AndroidDevicePool(device_profile)
        client = AppiumClientLocal()
        self.device_id = android.get_android_device_id()
        self.imsi = android.get_android_device_imsi()
        self.msisdn = android.get_android_device_msisdn()
        desired_caps = dict(automationName=client.name, platformName=android.platform, fastReset=android.fastReset,
                            deviceOrientation=android.orientation, deviceName=android.platform,
                            udid=self.device_id, appActivity=android.starupactivity,
                            appPackage=android.startuppackage)
        try:
            self.driver = webdriver.Remote(client.get_remote_url(), desired_caps)
            self.driver.implicitly_wait(timeout / timeout)
            super().__init__(self.driver, self.device_id)

        except NewConnectionError as error:
            print("Remote appium web driver Connection Error " + str(error))
        except MaxRetryError as error:
            print("Remote appium web driver Connection error " + str(error))
        except Exception as error:
            print("Remote appium web driver Connection error " + str(error))

        self.test_working_directory = '%s/' % os.getcwd()
        self.element_timeout = timeout
        self.result_directory = '%s/screenshot/' % os.getcwd()
        self.screen_page_name = 'android-screen'

    def __del__(self):
        try:
            if self.driver.session:
                self.driver.quit()
        except InvalidSessionIdException:
            pass
        except ValueError:
            print("Driver session not exist")

    # this function performs click on web element whose locator is passed to it.
    def find_element_and_click(self, by_locator):
        try:
            element = self.wait_for_element_to_be_visible_ec(by_locator)
            if element:
                self.driver.find_element(*by_locator).click()
        except Exception as error:
            print("Selenium exception in find_element_and_click " + str(error))

    def find_element_and_enter_text(self, by_locator, text):
        try:
            element = self.wait_for_element_to_be_visible_ec(by_locator)
            if element:
                self.driver.find_element(*by_locator).send_keys(text)
        except Exception as error:
            print("Selenium exception in find_element_and_enter_text " + str(error))

    def scroll_with_uiselector_contains_text(self, search_string):
        try:
            scroll_string = "new UiScrollable(new UiSelector().scrollable(true)." \
                        "instance(0)).scrollIntoView( new UiSelector()." \
                        "text(\"" + search_string + "\"));"
            self.driver.find_element_by_android_uiautomator(scroll_string)
        except Exception as error:
            print("Selenium exception in scroll_with_uiselector_contains_text " + str(error))

    def press_android_key(self, key):
        try:
            key_obj = AndroidKeys()
            self.driver.press_keycode(key_obj.get_android_key(key))
        except Exception as error:
            print("Selenium exception in press_android_key " + str(error))

    def wait_for_element_to_be_visible_ec(self, by_locator):
        try:
            wait = WebDriverWait(self.driver, self.element_timeout)
            element = wait.until(ec.visibility_of_element_located((by_locator[0], by_locator[1])))
            return element
        except Exception as error:
            print("Selenium exception in wait_for_element_to_be_visible_ec " + str(error))

    def wait_for_element_to_be_clickable(self, by_locator):
        try:
            wait = WebDriverWait(self.driver, self.element_timeout)
            element = wait.until(ec.element_to_be_clickable((by_locator[0], by_locator[1])))
            return element
        except Exception as error:
            print("Selenium exception in wait_for_element_to_be_clickable" + str(error))

    def get_android_network_connection_status(self):
        try:
            remote_driver_response = self.driver.execute(command.Command.GET_NETWORK_CONNECTION)
            find_status = AndroidNetworkConnection()
            return find_status.get_network_connection_status(remote_driver_response)
        except Exception as error:
            print("Selenium exception in get_android_network_connection_status " + str(error))

    def get_device_screen_shot(self):
        try:
            self.driver.save_screenshot(self.result_directory + self.screen_page_name + str(time.time_ns()) + '.png')
        except Exception as error:
            print("Selenium exception in get_device_screen_Shot " + str(error))

    @staticmethod
    def set_android_wait(seconds):
        time.sleep(seconds)

    def click_message_box(self, by_locator):
        try:
            wait = WebDriverWait(self.driver, (self.element_timeout / self.element_timeout))
            element = wait.until(ec.element_to_be_clickable((by_locator[0], by_locator[1])))
            element.click()
        except Exception as error:
            print("Selenium exception in click_message_box " + str(error))
