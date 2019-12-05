import re

start_app = {
    'command': 'am',
    'args': ['start -n', 'com.dab.dabtesto2/.MainActivity'],
    'includeStderr': True,
    'timeout': 5000
}

ping = {
    'command': 'ping',
    'args': ['-c 3',  '8.8.8.8'],
    'includeStderr': False,
    'timeout': 5000
}
stop_app = {
    'command': 'am',
    'args': ['force-stop', 'com.dab.dabtesto2'],
    'includeStderr': True,
    'timeout': 5000
}

network_type = {
    'command': 'am',
    'args': ['broadcast -a', 'com.dab.dabtesto2.GET_DATA_NETWORK_TYPE'],
    'includeStderr': True,
    'timeout': 5000
}

data_activity = {
    'command': 'am',
    'args': ['broadcast -a', 'com.dab.dabtesto2.GET_DATA_ACTIVITY'],
    'includeStderr': True,
    'timeout': 5000
}

device_ip = {
    'command': 'ip',
    'args': ['address'],
    'includeStderr': True,
    'timeout': 5000
}

data_state = {
    'command': 'am',
    'args': ['broadcast -a', 'com.dab.dabtesto2.GET_DATA_STATE'],
    'includeStderr': True,
    'timeout': 5000
}

imsi = {
    'command': 'am',
    'args': ['broadcast -a', 'com.dab.dabtesto2.GET_IMEI'],
    'includeStderr': True,
    'timeout': 5000
}

msisdn = {
    'command': 'am',
    'args': ['broadcast -a', 'com.dab.dabtesto2.GET_MSISDN'],
    'includeStderr': True,
    'timeout': 5000
}


class AndroidTestPluginApp:

    def __init__(self, driver, device_uid):
        self.driver = driver
        self.device_uid = device_uid

    def __del__(self):
        self.stop_android_plugin_app()

    def stop_android_plugin_app(self):
        self.driver.execute_script("mobile:shell", stop_app)

    def start_android_plugin_app(self):
        self.driver.execute_script("mobile:shell", start_app)
        self.change_plugin_app_permission()

    def get_data_activity(self):
        value = self.driver.execute_script("mobile:shell", ping)
        data = self.driver.execute_script("mobile:shell", data_activity)
        value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
        return value[0]

    def get_data_state(self):
        data = self.driver.execute_script("mobile:shell", data_state)
        value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
        return value[0]

    def get_data_network_type(self):
        data = self.driver.execute_script("mobile:shell", network_type)
        value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
        return value[0]

    def get_msisdn(self):
        data = self.driver.execute_script("mobile:shell", msisdn)
        value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
        return value[0]

    def get_imsi(self):
        data = self.driver.execute_script("mobile:shell", imsi)
        value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
        return value[0]

    def get_device_ip(self):
        output = self.driver.execute_script("mobile:shell", device_ip)
        value = re.sub(r"[\n\t\s]*", "", output['stdout'])
        ip_list = re.findall(r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/\d{1,3}", value)
        for item in ip_list:
            if not re.match(r"(^127.0.0.1)", item):
                return item

    def get_device_info(self):
        return self.driver.execute_script("mobile:deviceInfo")

    def dismiss_alert(self):
        self.driver.execute_script("mobile:dismissAlert")

    def accept_alert(self):
        self.driver.execute_script("mobile:acceptAlert")

    def change_plugin_app_permission(self):
        android_permission = {"action": "grant", "appPackage": "com.dab.dabtesto2", "permissions":
            ["android.permission.READ_PHONE_STATE", "android.permission.ACCESS_COARSE_LOCATION",
             "android.permission.ACCESS_FINE_LOCATION", "android.permission.READ_CALL_LOG"]}
        self.driver.execute_script("mobile:changePermissions", android_permission)
