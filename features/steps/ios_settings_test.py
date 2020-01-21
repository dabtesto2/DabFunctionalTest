from behave import Given

from iospages.iOSDevicePool import iPhoneDevicePool
from iospages.iossettings.iosSettings import iosSettings


@Given(u'Launch ios Settings for "{model}"')
def step_impl(context, model):
    ios_obj = iPhoneDevicePool(model)
    print("Device ID " + ios_obj.get_ios_device_id())
    settings_obj = iosSettings(ios_obj)


