from iospages.iOSDevicePool import iPhoneDevicePool


class iOSDevice(iPhoneDevicePool):

    def __init__(self, device_model):
        super.__init__(device_model)
