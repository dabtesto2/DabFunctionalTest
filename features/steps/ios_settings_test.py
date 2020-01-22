from behave import Given

from iospages.iOSDevice import iOSDevice
from iospages.iPhoneDevicePool import iPhoneDevicePool
from iospages.iossettings.iosSettings import iosSettings


@Given(u'Launch ios Settings for "{model}"')
def step_impl(context, model):
    iphone_obj = iPhoneDevicePool(model)
    settings_obj = iosSettings(iphone_obj)
    settings_obj.set_apn()


