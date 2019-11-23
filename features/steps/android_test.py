from behave import *

from androidpages.AndroidDevice import AndroidDevice
from hamcrest import *
import time


@given(u'Android device using "{device_profile}" select apn "{apn_name}" and wait for "{seconds}" sec')
def step_impl(context, device_profile, apn_name, seconds):
    context.device_profile = device_profile
    android_device_obj = AndroidDevice(device_profile)
    android_device_obj.select_apn(apn_name)
    android_device_obj.set_android_wait(int(seconds))
    android_device_obj.get_android_device_screen_shot()
    android_device_obj.click_android_home()
    del android_device_obj


@when(u'Network connection status is "{status}" collect device information')
def step_impl(context, status):
    android_device_obj = AndroidDevice(context.device_profile)
    context.device_id = android_device_obj.get_android_device_id()
    android_device_obj.open_android_device_status_page("About phone")
    android_device_obj.set_android_wait(2)
    network_conn = android_device_obj.get_network_connection()
    assert_that(network_conn, equal_to_ignoring_whitespace(status), raises(ValueError, network_conn))
    android_device_obj.get_android_device_screen_shot()
    del android_device_obj
