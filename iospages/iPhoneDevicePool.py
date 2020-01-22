class iPhoneDevicePool():

    def __init__(self, device_model):
        self.device_model = device_model
        self._device = {
            "dev1": {"udid": "8d0a9f6c8218eaa1356fdf3e4e08573d1228ae3a", "model": "iphone8",
                     "xcodesigningid": "test.tangent90.com", "xcodeorgid": "374Q29PQSM", "version": "13"}
        }

    def get_ios_device_id(self):
        for device in self._device.values():
            if device['model'] in self.device_model:
                return device['udid']
        raise Exception(f'Requested device model {self.device_model} not Found')

    def get_ios_device_xcodesigningid(self):
        for device in self._device.values():
            if device['model'] in self.device_model:
                return device['xcodesigningid']
        raise Exception(f'Requested device model {self.device_model} not Found')

    def get_ios_device_xcodeorgid(self):
        for device in self._device.values():
            if device['model'] in self.device_model:
                return device['xcodeorgid']
        raise Exception(f'Requested device model {self.device_model} not Found')

    def get_ios_device_version(self):
        for device in self._device.values():
            if device['model'] in self.device_model:
                return device['version']
        raise Exception(f'Requested device model {self.device_model} not Found')

    def get_ios_current_model(self):
        return self.device_model
