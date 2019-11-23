import time

from androidpages.BasePage import BasePage
from androidpages.Locators import SettingsPage, MobileNetworks , AboutPhone
from androidpages.Locators import ConnectionsPage
from androidpages.Locators import AccessPointNames




class AndroidDevice(BasePage):
    """ This class deals with operations on Android settings
        Add new APNs
        Reset all APNs
        Select APN for test
    """

    def __init__(self, device_profile):
        super().__init__(device_profile)

    def select_apn(self, name):
        # create object
        apn_name = AccessPointNames(name)
        self.open_apn_page()
        # scroll to the APN
        self.scroll_with_uiselector_contains_text(name)
        # Click Element
        self.find_element_and_click(apn_name.get_apn_xpath_locator())

    def set_apn_fields(self, locator, name, text, edit_text_locator):
        # scroll to the element
        self.scroll_with_uiselector_contains_text(name)
        # go to element and click
        self.find_element_and_click(locator)
        # Enter element text for give locator
        self.find_element_and_enter_text(edit_text_locator, text)
        # click OK
        self.find_element_and_click(AccessPointNames.OK)

    def reset_all_apn(self):
        self.find_element_and_click(AccessPointNames.MoreOptions)
        # Click Reset to Default
        self.find_element_and_click(AccessPointNames.ResetDefault)
        # Click OK
        self.find_element_and_click(AccessPointNames.Reset)

    def open_apn_page(self):
        # click connection
        self.find_element_and_click(SettingsPage.Connections)
        # click mobile networks
        self.find_element_and_click(ConnectionsPage.MobileNetwork)
        # click access point names
        self.find_element_and_click(MobileNetworks.AccesPointNames)

    def add_apn(self, apnname, apn, username, password, mmsc, mmsc_proxy, mms_port, proxy, port):
        # click Add
        self.find_element_and_click(AccessPointNames.Add)
        # Enter Name
        self.set_apn_fields(AccessPointNames.Name, "Name", apnname, AccessPointNames.EditText)
        # Enter APN
        self.set_apn_fields(AccessPointNames.Apn, "APN", apn, AccessPointNames.EditText)
        # Enter username
        self.set_apn_fields(AccessPointNames.Username, "APN", username, AccessPointNames.EditText)
        # Enter password
        self.set_apn_fields(AccessPointNames.Password, "APN", password, AccessPointNames.EditText)
        # Enter Proxy
        proxy_val = proxy.lower()
        if "empty" not in proxy_val:
            self.set_apn_fields(AccessPointNames.Proxy, "Proxy", proxy, AccessPointNames.EditText)
        # Enter Port
        port_val = port.lower()
        if "empty" not in port_val:
            self.set_apn_fields(AccessPointNames.Port, "Port", port, AccessPointNames.EditText)
        # Enter MMSC
        self.set_apn_fields(AccessPointNames.MMSC, "MMSC", mmsc, AccessPointNames.EditText)
        # Enter MMS proxy
        self.set_apn_fields(AccessPointNames.MMSProxy, "MMS proxy", mmsc_proxy, AccessPointNames.EditText)
        # Enter MMS port
        self.set_apn_fields(AccessPointNames.MMSPort, "MMS port", mms_port, AccessPointNames.EditText)
        # click more options
        self.find_element_and_click(AccessPointNames.MoreOptions)
        # Save all apn
        self.find_element_and_click(AccessPointNames.Save)

    def click_android_home(self):
        self.press_android_key('AKEYCODE_HOME')

    def get_network_connection(self):
        return self.get_android_network_connection_status()

    def get_android_device_screen_shot(self):
        return self.get_device_screen_shot()

    def get_android_device_id(self):
        return self.device_id

    def open_android_device_status_page(self,name):
        # scroll to the element
        self.scroll_with_uiselector_contains_text(name)
        # click About phone
        self.find_element_and_click(SettingsPage.AboutPhone)
        # click status
        self.find_element_and_click(AboutPhone.status)
