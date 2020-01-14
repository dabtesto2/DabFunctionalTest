from iospages.AppiumClientLocal import AppiumClientLocal
from appium import webdriver


class SafariPage:
    def __init__(self, device_profile, timeout=10):
        self.safari_driver_timeout = timeout
        self.html_links = []
        self.platform = "iOS"
        self.scroll = 10
        self.browser = "Safari"
        self.device_id = device_profile
        client = AppiumClientLocal()
        desired_caps = dict(automationName=client.name, platformName=self.platform, browserName=self.browser,
                            udid=self.device_id, deviceName=self.platform
                            )
        self.driver = webdriver.Remote(client.get_remote_url(), desired_caps)
        self.driver.implicitly_wait(self.safari_driver_timeout)

    def print_links_from_safari_page(self):
        pass
