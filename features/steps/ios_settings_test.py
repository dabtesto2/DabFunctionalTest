from behave import Given

from iospages.iOSDevicePool import iPhoneDevicePool


@Given(u'Launch ios Settings for "{model}"')
def step_impl(context, model):
    ios_obj = iPhoneDevicePool(model)
    print("value " + ios_obj.get_ios_device_id())
