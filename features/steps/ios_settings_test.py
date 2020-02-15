import allure
from allure_commons.types import AttachmentType
from behave import Given

from iospages.iOSDevice import iOSDevice
from iospages.iPhoneDevicePool import iPhoneDevicePool
from iospages.iossettings.iosSettings import iosSettings


@Given(u'Launch ios Settings for "{model}" with "{apn}" "{username}" "{password}" "{time_wait}"')
def step_impl(context, model, apn, username, password, time_wait):
    iphone_obj = iPhoneDevicePool(model)
    settings_obj = iosSettings(iphone_obj)
    settings_obj.switch_airplane_mode("off")
    settings_obj.set_apn(apn, username, password, time_wait)
    allure.attach(settings_obj.save_settings_page_screenshot(), name="New PDP context",
                  attachment_type=AttachmentType.PNG)
    settings_obj.switch_airplane_mode("on")
    settings_obj.switch_airplane_mode("off")
    settings_obj.set_iOS_wait(7)
    allure.attach(settings_obj.save_settings_page_screenshot(), name="Mobile Data status",
                  attachment_type=AttachmentType.PNG)

