import time
from selenium.common.exceptions import TimeoutException

from androidpages.BasePage import BasePage
from androidpages.Locators import SettingsPage, MobileNetworks, AboutPhone
from androidpages.Locators import ConnectionsPage
from androidpages.Locators import AccessPointNames, MessageBox


class AndroidDevice(BasePage):
    """ This class deals with operations on Android settings
        Add new APNs
        Reset all APNs
        Select APN for test
    """

    def __init__(self, device_profile):
        super().__init__(device_profile)

    def select_apn(self, name):
        try:
            # create object
            apn_name = AccessPointNames(name)
            self.open_apn_page()
            # scroll to the APN
            self.scroll_with_uiselector_contains_text(name)
            # Click Element
            self.find_element_and_click(apn_name.get_apn_xpath_locator())
        except Exception as error:
            print(" Selenium exception during select_apn " + str(error))

    def set_apn_fields(self, locator, name, text, edit_text_locator):
        try:
            # scroll to the element
            self.scroll_with_uiselector_contains_text(name)
            # go to element and click
            self.find_element_and_click(locator)
            # Enter element text for give locator
            self.find_element_and_enter_text(edit_text_locator, text)
            # click OK
            self.find_element_and_click(AccessPointNames.OK)
        except Exception as error:
            print("Selenium exception during set_apn_fields " + str(error))

    def reset_all_apn(self):
        try:
            self.find_element_and_click(AccessPointNames.MoreOptions)
            # Click Reset to Default
            self.find_element_and_click(AccessPointNames.ResetDefault)
            # Click OK
            self.find_element_and_click(AccessPointNames.Reset)
        except Exception as error:
            print("Selenium exception during reset_all_apn " + str(error))

    def open_apn_page(self):
        try:
            # click connection
            self.find_element_and_click(SettingsPage.Connections)
            # click mobile networks
            self.find_element_and_click(ConnectionsPage.MobileNetwork)
            # click access point names
            self.find_element_and_click(MobileNetworks.AccesPointNames)
        except Exception as error:
            print("Selenium exception during open_apn_page " + str(error))

    def add_apn(self, apnname, apn, username, password, mmsc, mmsc_proxy, mms_port, proxy, port):
        try:
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
        except Exception as error:
            print("Selenium exception during add_apn " + str(error))

    def click_android_home(self):
        try:
            self.press_android_key('AKEYCODE_HOME')
        except Exception as error:
            print("Selenium exception during click_android_home " + str(error))

    def get_network_connection(self):
        try:
            return self.get_android_network_connection_status()
        except Exception as error:
            print("Selenium exception during get_network_connection " + str(error))

    def get_android_device_screen_shot(self):
        try:
            return self.get_device_screen_shot()
        except Exception as error:
            print("Selenium exception during get_android_device_screen_shot " + str(error))

    def get_android_device_id(self):
        return self.device_id

    def open_android_device_status_page(self, name):
        try:
            # scroll to the element
            self.scroll_with_uiselector_contains_text(name)
            # click About phone
            self.find_element_and_click(SettingsPage.AboutPhone)
            # click status
            self.find_element_and_click(AboutPhone.status)
        except Exception as error:
            print("Selenium exception during open_android_device_status_page " + str(error))

    def dismiss_message_box(self):
        try:
            self.click_message_box(MessageBox.dismiss_alert)
        except TimeoutException:
            pass
