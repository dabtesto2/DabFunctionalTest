from allure_commons.types import AttachmentType
from behave import *
import allure
from androidpages.AndroidDevice import AndroidDevice
from hamcrest import *
import time


@given(u'Android device using "{device_profile}" select apn "{apn_name}" and wait for "{seconds}" sec')
def step_impl(context, device_profile, apn_name, seconds):
    context.device_profile = device_profile
    android_device_obj = AndroidDevice(device_profile)
    android_device_obj.dismiss_message_box_if_any()
    android_device_obj.select_apn(apn_name)
    android_device_obj.set_android_wait(int(seconds))
    allure.attach('step-: select apn', android_device_obj.get_android_device_screen_shot(),
                  type=AttachmentType.PNG)
    android_device_obj.click_android_home()
    del android_device_obj


@when(u'Network connection status is "{status}" collect device information')
def step_impl(context, status):
    android_device_obj = AndroidDevice(context.device_profile)
    android_device_obj.dismiss_message_box_if_any()
    context.device_id = android_device_obj.get_android_device_id()
    android_device_obj.open_android_device_status_page("About phone")
    android_device_obj.set_android_wait(2)
    network_conn = android_device_obj.get_network_connection()
    allure.attach('step-:check data connection status', android_device_obj.get_android_device_screen_shot(),
                  type=AttachmentType.PNG)
    assert_that(network_conn, equal_to_ignoring_whitespace(status),
                raises(ValueError, "No User plane for this session Mobile returned status = " + network_conn))
    print(android_device_obj.get_device_info())
    del android_device_obj


@then(u'Data can be downloaded for "{device_profile}" subscriber with network type "{network_type}"')
def step_impl(context, device_profile, network_type):
    android_device_obj = AndroidDevice(device_profile)
    android_device_obj.dismiss_message_box_if_any()
    android_device_obj.start_android_plugin_app()
    allure.attach('step-:check data downloaded', android_device_obj.get_android_device_screen_shot(),
                  type=AttachmentType.PNG)
    assert_that(android_device_obj.get_data_network_type(), contains_string(network_type), "Network type not matched")
    print("Network Type assigned for the device  "+android_device_obj.get_data_network_type())
    print("Data Connection State  " + android_device_obj.get_data_state())
    assert_that(android_device_obj.get_data_state(), contains_string("DATA_CONNECTED"),
                "No Data session")
    print("Data Activity  " + android_device_obj.get_data_activity())
    assert_that(android_device_obj.get_data_activity(), contains_string("DATA_ACTIVITY_INOUT"),
                "No User plane D/L for subscriber")
    assert_that(android_device_obj.get_msisdn(),
                not_(android_device_obj.get_android_msisdn()), "MSISDN mismatch")
    print("MSISDN  " + android_device_obj.get_msisdn())
    assert_that(android_device_obj.get_imsi(),
                contains_string(android_device_obj.get_android_imsi()), "IMSI mismatch")
    print("IMSI  " + android_device_obj.get_imsi())
    print(android_device_obj.get_device_ip())
    android_device_obj.stop_android_plugin_app()
    del android_device_obj
