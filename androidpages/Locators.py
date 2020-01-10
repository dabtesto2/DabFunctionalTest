from appium.webdriver.common.mobileby import MobileBy


class SettingsPage:
    """
        Locators for Settings Page
    """
    Connections = (MobileBy.XPATH, "//android.widget.TextView[@text='Connections']")
    AboutPhone = (MobileBy.XPATH, "//android.widget.TextView[@text='About phone']")
    Display = (MobileBy.XPATH, "//android.widget.TextView[@text='Display']")
    Apps = (MobileBy.XPATH, "//android.widget.TextView[@text='Apps']")


class ConnectionsPage:
    """
        Locators for Connections Page
    """
    MobileNetwork = (MobileBy.XPATH, "//android.widget.TextView[@text='Mobile networks']")


class AboutPhone:
    """
            Locators for AboutPhone Page
    """
    status = (MobileBy.XPATH, "//android.widget.TextView[@text='Status']")


class MobileNetworks:
    """
        Locators for Mobile Networks Page
    """
    AccesPointNames = (MobileBy.XPATH, "//android.widget.TextView[@text='Access Point Names']")


class MessageBox:
    dismiss_alert = (MobileBy.XPATH, "//android.widget.Button[@text='OK']")


class AccessPointNames:
    """
        Locators for AccessPointNames Page

    To Find the Radio button to select APN following logic used :
    using xml layout , known value is Textview [apn name] and using that as unique
    indentity determine the Xpath for the Radio button for APN name
    Android Xml Layout of APN Name field
    <android.widget.LinearLayout ..>
    <android.widget.RadioButton .. />  <- Radio button to slect using xpath
    <android.widget.RelativeLayout ..>  cd ../
    <android.widget.TextView .. text=ibrowse-func-epg2>  cd ../
    <android.widget.TextView .. text=dab.test.apn2 />
    </android.widget.RelativeLayout>
    </android.widget.LinearLayout>

    """

    def __init__(self, apn_name):
        self.apn_xpath = "//android.widget.TextView[contains(@text,\'" + apn_name + "')]/../../android.widget.RadioButton"
        self.apnname = (MobileBy.XPATH, self.apn_xpath)

    def get_apn_xpath_locator(self):
        return self.apnname

    Name = (MobileBy.XPATH, "//android.widget.TextView[@text='Name']")
    Apn = (MobileBy.XPATH, "//android.widget.TextView[@text='APN']")
    Username = (MobileBy.XPATH, "//android.widget.TextView[@text='Username']")
    Password = (MobileBy.XPATH, "//android.widget.TextView[@text='Password']")
    Proxy = (MobileBy.XPATH, "//android.widget.TextView[@text='Proxy']")
    Port = (MobileBy.XPATH, "//android.widget.TextView[@text='Port']")
    MMSC = (MobileBy.XPATH, "//android.widget.TextView[@text='MMSC']")
    MMSProxy = (MobileBy.XPATH, "//android.widget.TextView[@text='MMS proxy']")
    MMSPort = (MobileBy.XPATH, "//android.widget.TextView[@text='MMS port']")
    MoreOptions = (MobileBy.XPATH, "//android.widget.ImageView[@content-desc='More options']")
    Save = (MobileBy.XPATH, "//android.widget.TextView[@text='Save']")
    ResetDefault = (MobileBy.XPATH, "//android.widget.TextView[@text='Reset to default']")
    Add = (MobileBy.XPATH, "//android.widget.Button[@text='Add']")
    OK = (MobileBy.XPATH, "//android.widget.Button[@text='OK']")
    Reset = (MobileBy.XPATH, "//android.widget.Button[@text='Reset']")
    EditText = (MobileBy.XPATH, "//android.widget.EditText")


class chromepage:
    DynamicLinks = (MobileBy.XPATH, "//a[@href]")
    ChromePageError = (MobileBy.XPATH, "//*[contains(@text, 'ERR_')]")
    ChromePageErrorBtnReload = (MobileBy.XPATH, "//button[text()='Reload']")
    ChromePageErrorBtnDetails = (MobileBy.XPATH, "//button[text()='Details']")
