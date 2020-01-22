from selenium.common.exceptions import StaleElementReferenceException, TimeoutException
from selenium.webdriver.support.wait import WebDriverWait
from iospages.AppiumClientLocal import AppiumClientLocal
from appium import webdriver


class iosSettings:
    def __init__(self, ios_obj, timeout=10):
        self.safari_driver_timeout = timeout
        self.html_links = []
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
        self.driver = webdriver.Remote(client.get_remote_url(), desired_caps)
        self.driver.implicitly_wait(self.safari_driver_timeout)

    def click_airplane_mode(self):
        element = self.driver.find_element_by_accessibility_id('Mobile Data')
        try:
            print("value " + element.get_attribute('UID'))
            print("value " + element.get_attribute('name'))
            print("value " + element.get_attribute('label'))
            print("value " + element.get_attribute('enabled'))
            print("value " + element.get_attribute('visible'))
            element.get_attribute('UID').click()
        except Exception as error:
            print("Selenium exception in click_airplane_mode " + str(error))
