import allure
from allure_commons.types import AttachmentType
from behave import then, Given
from chrome.ChromeDriverPage import ChromeDriverPage


@Given(u'Open chrome browser get url "{url}" using "{device}"')
def step_impl(context, url, device):
    context.url = url
    chrome_page_obj = ChromeDriverPage(device)
    chrome_page_obj.get_web_page_using_chrome_browser(url)
    chrome_page_obj.driver.delete_all_cookies()
    context.chrome_page_obj = chrome_page_obj


@then(u'print links from page')
def step_impl(context):
    context.chrome_page_obj.print_links_from_page()
    del context.chrome_page_obj


@then(u'Check if page loads with "{link}"')
def step_impl(context, link):
    context.chrome_page_obj.check_document_ready_state(context.url)
    context.chrome_page_obj.click_link_on_page(link)
    allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name="Chrome_" + link,
                  attachment_type=AttachmentType.PNG)
    del context.chrome_page_obj
