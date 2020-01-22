from iospages.iOSDevicePool import iPhoneDevicePool


class iOSDevice():

    def __init__(self, device_model):
        super.__init__(device_model)

    def find_element_by_accessibility_id_and_click(self,name):
        try:
            element = self.driver.find_element_by_accessibility_id(name)
            if element.get_attribute('enabled') and element.get_attribute('visible'):
                element.click()
        except Exception as error:
            print("Selenium exception in find_element_by_accessibility_id_and_click " + str(error))

    def find_element_by_accessibility_id_and_enter_text(self,name,text):
        try:
            element = self.driver.find_element_by_accessibility_id(name)
            if element.get_attribute('enabled') and element.get_attribute('visible'):
                element.clear()
                element.send_keys(text)
        except Exception as error:
            print("Selenium exception in find_element_by_accessibility_id_and_enter_text " + str(error))