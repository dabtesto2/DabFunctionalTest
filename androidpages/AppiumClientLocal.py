class AppiumClientLocal:
    def __init__(self):
        self._url = "http://77.102.130.243:4723/wd/hub"
        #82.13.42.180
        self.name = "UiAutomator2"
        self.appium_path = "/usr/local/lib/node_modules/appium/build/lib/main.js"
        self.node_path = "/usr/local/bin/node"
        self.args = ['--address', '82.13.42.180', '--session-override', 'true']

    def get_remote_url(self):
        return self._url
