from selenium.common.exceptions import StaleElementReferenceException, TimeoutException
from selenium.webdriver.support.wait import WebDriverWait
from iospages.AppiumClientLocal import AppiumClientLocal
from appium import webdriver

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
            super().__init__(ios_obj.get_ios_current_model,self.driver)
        except Exception as error:
            print("Selenium exception in iosSettings " + str(error))

    def set_apn(self):
        try:
            self.find_element_by_accessibility_id_and_click('Mobile Data')
            self.find_element_by_accessibility_id_and_click('Mobile Data Network')
            self.find_element_by_accessibility_id_and_enter_text('APN','dab.test.apn1')
            self.find_element_by_accessibility_id_and_enter_text('Username', 'dabfull@idata.dabfull.ref')
            self.find_element_by_accessibility_id_and_enter_text('Password', 'Password')
            self.driver.back()
            self.driver.back()
            self.find_element_by_accessibility_id_and_click('Airplane Mode')
        except Exception as error:
            print("Selenium exception in set_apn " + str(error))
