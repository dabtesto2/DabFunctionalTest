class AndroidDevicePool():

    def __init__(self, device_profile):
        self.device_profile = device_profile
        self._device = {
            "dev1": {"udid": "ce0417145b24bca70d", "profile": "NDS", "msisdn": "447516903691", "imsi":"234106663078773"},
            "dev2": {"udid": "2adbc704fc0d7ece", "profile": "PC", "msisdn":"447725629466", "imsi":"234106663078775"},
            "dev3": {"udid": "ce071717ab7bd73901", "profile": "OA",  "msisdn": "447517999432", "imsi":"234101333546803"}
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

    def get_android_device_msisdn(self):
        for device in self._device.values():
            if device['profile'] in self.device_profile:
                return device['msisdn']
        raise Exception(f'Requested device profile {self.device_profile} not Found')

    def get_android_device_imsi(self):
        for device in self._device.values():
            if device['profile'] in self.device_profile:
                return device['imsi']
        raise Exception(f'Requested device profile {self.device_profile} not Found')