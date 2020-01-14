class AppiumClientLocal:

    def __init__(self):
        self._url = "http://77.102.130.243:4723/wd/hub"
        self.name = "XCUITest"

    def get_remote_url(self):
        return self._url

