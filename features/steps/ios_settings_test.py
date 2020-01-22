from behave import Given

from iospages.iOSDevice import iOSDevice
from iospages.iOSDevicePool import iPhoneDevicePool
from iospages.iossettings.iosSettings import iosSettings


@Given(u'Launch ios Settings for "{model}"')
def step_impl(context, model):
    ios_obj = iOSDevice(model)
    settings_obj = iosSettings(ios_obj)
    settings_obj.set_apn()


