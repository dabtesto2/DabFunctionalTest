from selenium.common.exceptions import StaleElementReferenceException, TimeoutException
from selenium.webdriver.support.wait import WebDriverWait
from iospages.AppiumClientLocal import AppiumClientLocal
from appium import webdriver
import time

from iospages.iOSDevice import iOSDevice


class iosSettings(iOSDevice):
    def __init__(self, ios_obj, timeout=10):
        self.safari_driver_timeout = timeout
        self.platform = "iOS"
        self.version = ios_obj.get_ios_device_version()
        self.timeout = 120000
        self.app = "Settings"
        self.orientation = "PORTRAIT"
        self.xcodesigninid = ios_obj.get_ios_device_xcodesigningid()
        self.xcodeorgid = ios_obj.get_ios_device_xcodeorgid()
        self.device_id = ios_obj.get_ios_device_id()
        client = AppiumClientLocal()
        desired_caps = dict(automationName=client.name, platformName=self.platform, app=self.app,
                            udid=self.device_id, deviceName=self.platform, platformVersion=self.version,
                            startIWDP="true", orientation=self.orientation, commandTimeouts=self.timeout,
                            noReset="true", xcodeSigningId=self.xcodesigninid, xcodeOrgId=self.xcodeorgid,
                            showXcodeLog="true", wdaLaunchTimeout=self.timeout,
                            wdaConnectionTimeout=self.timeout
                            )
        try:
            self.driver = webdriver.Remote(client.get_remote_url(), desired_caps)
            self.driver.implicitly_wait(self.safari_driver_timeout)
            super().__init__(ios_obj.get_ios_current_model, self.driver)
        except Exception as error:
            print("Selenium exception in iosSettings " + str(error))

    def set_apn(self, apn, username, password, time_wait):
        try:
            self.find_element_by_accessibility_id_and_click('Mobile Data')
            self.find_element_by_accessibility_id_and_click('Mobile Data Network')
            self.find_element_by_accessibility_id_and_enter_text('APN', apn)
            self.find_element_by_accessibility_id_and_enter_text('Username', username)
            self.find_element_by_accessibility_id_and_enter_text('Password', password)
        except Exception as error:
            print("Selenium exception in set_apn " + str(error))

    def click_back_btn_ios(self):
        try:
            self.driver.back()
            self.driver.back()
        except Exception as error:
            print("Selenium exception in click_back_btn_ios " + str(error))

    def switch_airplane_mode(self,switch):
        try:
            self.find_element_by_accessibility_id_and_switch('Airplane Mode',switch)
        except Exception as error:
            print("Selenium exception in switch_airplane_mode " + str(error))

    @staticmethod
    def set_iOS_wait(seconds):
        time.sleep(seconds)

    def save_settings_page_screenshot(self):
        try:
            return self.driver.get_screenshot_as_png()
        except Exception as error:
            print("Settings page exception at save_safari_web_page_screenshot " + str(error))

    def __del__(self):
        self.driver.quit()