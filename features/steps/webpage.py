import allure
from allure_commons.types import AttachmentType
from behave import then
from chrome.ChromeDriverPage import ChromeDriverPage


@then(u'Open chrome browser and get url "{url}"')
def step_impl(context, url):
    chrome_page_obj = ChromeDriverPage(context.device_id)
    chrome_page_obj.dismiss_message_box_if_any()
    chrome_page_obj.get_web_page_using_chrome_browser(url)
    allure.attach(chrome_page_obj.save_chrome_web_page_screenshot(), name="Chrome_page",
                  attachment_type=AttachmentType.PNG)
    context.chrome_page_obj = chrome_page_obj
    del context.chrome_page_obj
