class AndroidDevicePool():

    def __init__(self, device_profile):
        self.device_profile = device_profile
        self._device = {
            "dev1": {"udid": "RFCR50LP8QL", "profile": "NDS", "msisdn": "447563032351", "imsi":"355008371191036","model":"Galaxy S20"},
            "dev2": {"udid": "RFCR50LP8QL", "profile": "PC", "msisdn":"447563032351", "imsi":"355008371191036","model":"Galaxy S20"},
            "dev3": {"udid": "RFCR50LP8QL", "profile": "OA",  "msisdn": "447563032351", "imsi":"355008371191036","model":"Galaxy S20"}
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

    def get_android_device_id_for_model(self):
        for device in self._device.values():
            if device['model'] in self.device_profile:
                return device['udid']
        raise Exception(f'Requested device model {self.device_profile} not Found')