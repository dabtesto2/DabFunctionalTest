from behave import *
from androidpages.AndroidDevice import AndroidDevice


@given(u'Reset all APN for device with "{device_profile}" profile to factory settings')
def step_impl(context, device_profile):
    android_device_obj = AndroidDevice(device_profile)
    android_device_obj.open_apn_page()
    android_device_obj.reset_all_apn()
    android_device_obj.get_android_device_screen_shot()
    del android_device_obj


@given(u'Add APN "{apn_n}" "{apn}" "{user}" "{passwd}" "{mmsc}" "{mmsc_prxy}" "{mms_port}" "{proxy}" "{port}" to device profile')
def step_impl_add_apn_with_proxy(context,apn_n, apn, user, passwd, mmsc, mmsc_prxy, mms_port, proxy, port):
    android_device_obj = AndroidDevice("NDS")
    android_device_obj.open_apn_page()
    android_device_obj.add_apn(apn_n, apn, user, passwd, mmsc, mmsc_prxy, mms_port, proxy, port)
    del android_device_obj
