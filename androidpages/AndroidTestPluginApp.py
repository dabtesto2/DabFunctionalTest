android_plugin_app_package = "com.dab.dabtesto2"
android_plugin_app_activity = "com.dab.dabtesto2/.MainActivity"
broad_cast_activity = " am broadcast -a "
start_app = " shell am start -n "
stop_app = " shell am  force-stop "


class AndroidTestPluginApp:

    def __init__(self, driver, device_uid):
        self.driver = driver
        self.device_uid = device_uid
        self.start_android_plugin_app()
        self.get_data_activity = broad_cast_activity + android_plugin_app_package + ".GET_DATA_ACTIVITY"
        self.get_data_state = broad_cast_activity + android_plugin_app_package + ".GET_DATA_STATE"
        self.get_data_network_type = broad_cast_activity + android_plugin_app_package + ".GET_DATA_NETWORK_TYPE"
        self.get_msisdn = broad_cast_activity + android_plugin_app_package + ".GET_MSISDN"
        self.get_imei = broad_cast_activity + android_plugin_app_package + ".GET_IMEI"

    def __del__(self):
        self.stop_android_plugin_app()

    def execute_adb_shell(self, arg):
        self.driver.execute_script("mobile:shell", arg)

    def stop_android_plugin_app(self):
        self.execute_adb_shell(stop_app + android_plugin_app_package)

    def start_android_plugin_app(self):
        self.execute_adb_shell(start_app + android_plugin_app_activity)

    def get_data_activity(self):
        return self.execute_adb_shell(self.get_data_activity)

    def get_data_state(self):
        return self.execute_adb_shell(self.get_data_state)

    def get_data_network_type(self):
        return self.execute_adb_shell(self.get_data_network_type)

    def get_msisdn(self):
        return self.execute_adb_shell(self.get_msisdn)

    def get_imei(self):
        return self.execute_adb_shell(self.get_imei)

    def get_device_info(self):
        return self.driver.execute_script("mobile:deviceinfo")

    def dismiss_alert(self):
        self.driver.execute_script("mobile:dismissAlert")

    def accept_alert(self):
        self.driver.execute_script("mobile:acceptAlert")

    def change_plugin_app_permission(self):
        android_permission = {"action": "grant", "appPackage": "com.dab.dabtesto2", "permissions":
            ["android.permission.READ_PHONE_STATE", "android.permission.ACCESS_COARSE_LOCATION",
             "android.permission.ACCESS_FINE_LOCATION", "android.permission.READ_CALL_LOG"]}
        self.driver.execute_script("mobile:changePermissions", android_permission)
