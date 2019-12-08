import re

start_app = {
    'command': 'am',
    'args': ['start -n', 'com.dab.dabo2/.MainActivity'],
    'includeStderr': True,
    'timeout': 5000
}

stop_app = {
    'command': 'am',
    'args': ['force-stop', 'com.dab.dabo2'],
    'includeStderr': True,
    'timeout': 5000
}

network_type = {
    'command': 'am',
    'args': ['broadcast -a', 'com.dab.dabo2.GET_DATA_NETWORK_TYPE'],
    'includeStderr': True,
    'timeout': 5000
}

data_activity = {
    'command': 'am',
    'args': ['broadcast -a', 'com.dab.dabo2.GET_DATA_ACTIVITY'],
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
    'args': ['broadcast -a', 'com.dab.dabo2.GET_DATA_STATE'],
    'includeStderr': True,
    'timeout': 5000
}

imsi = {
    'command': 'am',
    'args': ['broadcast -a', 'com.dab.dabo2.GET_IMSI'],
    'includeStderr': True,
    'timeout': 5000
}

msisdn = {
    'command': 'am',
    'args': ['broadcast -a', 'com.dab.dabo2.GET_MSISDN'],
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
        try:
            self.driver.execute_script("mobile:shell", stop_app)
        except Exception as error:
            print("Exception occurred at stop_android_plugin_app " + str(error))

    def start_android_plugin_app(self):
        try:
            self.driver.execute_script("mobile:shell", start_app)
            self.change_plugin_app_permission()
        except Exception as error:
            print("Exception occurred at start_android_plugin_app " + str(error))

    def get_data_activity(self):
        try:
            for loop in range(1, 10):
                data = self.driver.execute_script("mobile:shell", data_activity)
                value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
                print("get_data_activity " + str(loop) + str(value[0]))
                if "INOUT" in value[0]:
                    return value[0]
        except Exception as error:
            print("Exception occurred at get_data_activity " + str(error))

    def get_data_state(self):
        try:
            data = self.driver.execute_script("mobile:shell", data_state)
            value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
            return value[0]
        except Exception as error:
            print("Exception occurred at get_data_state " + str(error))

    def get_data_network_type(self):
        try:
            data = self.driver.execute_script("mobile:shell", network_type)
            value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
            return value[0]
        except Exception as error:
            print("Exception occurred at get_data_network_type " + str(error))

    def get_msisdn(self):
        try:
            data = self.driver.execute_script("mobile:shell", msisdn)
            value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
            return value[0]
        except Exception as error:
            print("Exception occurred at get_msisdn " + str(error))

    def get_imsi(self):
        try:
            data = self.driver.execute_script("mobile:shell", imsi)
            value = re.findall(r".*data\=\"(.*)\".*", data['stdout'])
            return value[0]
        except Exception as error:
            print("Exception occurred at get_imsi " + str(error))

    def get_device_ip(self):
        try:
            output = self.driver.execute_script("mobile:shell", device_ip)
            value = re.sub(r"[\n\t\s]*", "", output['stdout'])
            ip_list = re.findall(r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/\d{1,3}", value)
            for item in ip_list:
                if not re.match(r"(^127.0.0.1)", item):
                    return item
        except Exception as error:
            print("Exception occurred at get_device_ip " + str(error))

    def get_device_info(self):
        try:
            return self.driver.execute_script("mobile:deviceInfo")
        except Exception as error:
            print("Exception occurred at get_device_info " + str(error))

    def dismiss_alert(self):
        try:
            self.driver.execute_script("mobile:dismissAlert")
        except Exception as error:
            print("Exception occurred at dismiss_alert " + str(error))

    def accept_alert(self):
        try:
            self.driver.execute_script("mobile:acceptAlert")
        except Exception as error:
            print("Exception occurred at accept_alert " + str(error))

    def change_plugin_app_permission(self):
        try:
            android_permission = {"action": "grant", "appPackage": "com.dab.dabo2", "permissions":
            ["android.permission.READ_PHONE_STATE", "android.permission.ACCESS_COARSE_LOCATION",
             "android.permission.ACCESS_FINE_LOCATION", "android.permission.READ_CALL_LOG"]}
            self.driver.execute_script("mobile:changePermissions", android_permission)
        except Exception as error:
            print("Exception occurred at accept_alert " + str(error))
