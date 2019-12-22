from allure_commons.types import AttachmentType
from behave import *
import allure
from androidpages.AndroidDevice import AndroidDevice
from hamcrest import *
import time


@given(u'Android device using "{device_profile}" select apn "{apn_name}" and wait for "{seconds}" sec')
def step_impl(context, device_profile, apn_name, seconds):
    if not ("same-apn" in apn_name):
        context.device_profile = device_profile
        android_device_obj = AndroidDevice(device_profile)
        android_device_obj.dismiss_message_box_if_any()
        android_device_obj.stop_android_plugin_app()
        android_device_obj.select_apn(apn_name)
        android_device_obj.stop_android_plugin_app()
        android_device_obj.start_android_plugin_app()
        print("Data Connection State  " + android_device_obj.get_data_state(int(seconds)))
        assert_that(android_device_obj.get_data_state(int(seconds)), contains_string("DATA_CONNECTED"),
                    "No Data session")
        allure.attach(android_device_obj.get_android_device_screen_shot(), name="apn_select_" + apn_name,
                      attachment_type=AttachmentType.PNG)
        android_device_obj.click_android_home()
        del android_device_obj
    else:
        context.device_profile = device_profile
        print("skip select APN.")


@when(u'Network connection status is "{status}" collect device information')
def step_impl(context, status):
    android_device_obj = AndroidDevice(context.device_profile)
    android_device_obj.dismiss_message_box_if_any()
    context.device_id = android_device_obj.get_android_device_id()
    android_device_obj.open_android_device_status_page("About phone")
    android_device_obj.set_android_wait(2)
    network_conn = android_device_obj.get_network_connection()
    allure.attach(android_device_obj.get_android_device_screen_shot(), name="Device_ip_status",
                  attachment_type=AttachmentType.PNG)
    assert_that(network_conn, equal_to_ignoring_whitespace(status),
                raises(ValueError, "No User plane for this session Mobile returned status = " + network_conn))
    print(android_device_obj.get_device_info())
    del android_device_obj


@then(u'Data can be downloaded with "{device_profile}" and network "{network_type}" wait for "{seconds}" sec')
def step_impl(context, device_profile, network_type, seconds):
    network_types = network_type.split(",")
    android_device_obj = AndroidDevice(device_profile)
    android_device_obj.dismiss_message_box_if_any()
    android_device_obj.stop_android_plugin_app()
    android_device_obj.start_android_plugin_app()
    allure.attach(android_device_obj.get_android_device_screen_shot(), name="Check_Data_connection_status",
                  attachment_type=AttachmentType.PNG)
    assert_that(android_device_obj.get_data_network_type(), any_of(contains_string(network_types[0]),
                                                                   contains_string(network_types[1]),
                                                                   contains_string(network_types[2]),
                                                                   contains_string(network_types[3])),
                "Device Not attached to Network 4G or 3G")
    print("Network Type assigned for the device  " + android_device_obj.get_data_network_type())
    print("Data Connection State  " + android_device_obj.get_data_state(int(seconds)))
    assert_that(android_device_obj.get_data_state(int(seconds)), contains_string("DATA_CONNECTED"),
                "No Data session")
    print("Data Activity  " + android_device_obj.get_data_activity(int(seconds)))
    assert_that(android_device_obj.get_data_activity(int(seconds)), contains_string("DATA_ACTIVITY_INOUT"),
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
