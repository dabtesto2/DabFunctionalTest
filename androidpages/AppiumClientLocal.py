class AppiumClientLocal:
    def __init__(self):
        self._url = "http://82.13.42.180:4723/wd/hub"
        self.name = "uiautomator2"
        self.appium_path = "/usr/local/lib/node_modules/appium/build/lib/main.js"
        self.node_path = "/usr/local/bin/node"
        self.args = ['--address', '82.13.42.180', '--session-override', 'true']

    def get_remote_url(self):
        return self._url
