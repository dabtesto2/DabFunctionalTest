class AppiumClientLocal:
    def __init__(self):
        self._url = "http://86.21.181.20:4723/wd/hub"
        self.name = "UiAutomator2"

    def get_remote_url(self):
        return self._url
