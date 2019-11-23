class AndroidDevicePool():

    def __init__(self, device_profile):
        self.device_profile = device_profile
        self._device = {
            "dev1": {"udid": "ce0417145b24bca70d", "profile": "NDS"},
            "dev2": {"udid": "2adbc704fc0d7ece", "profile": "PC"},
            "dev3": {"udid": "ce0417145b24bca70d", "profile": "OA"}
        }
        self.platform = "Android"
        self.fastReset = True
        self.orientation = "portrait"
        self.starupactivity = ".Settings"
        self.startuppackage = "com.android.settings"
        self.browsernamechrome = "chrome"


    def get_android_device_id(self):
        for device in self._device.values():
            if device['profile'] in self.device_profile:
                return device['udid']
        raise Exception(f'Requested device profile {self.device_profile} not Found')

