import allure
from allure_commons.types import AttachmentType
from behave import then, Given
from chrome.ChromeDriverPage import ChromeDriverPage


@Given(u'Open chrome browser get url "{url}" using "{device}"')
def step_impl(context, url, device):
    context.url = url
    chrome_page_obj = ChromeDriverPage(device)
    chrome_page_obj.get_web_page_using_chrome_browser(url)
    context.chrome_page_obj = chrome_page_obj


@then(u'print links from page')
def step_impl(context):
    context.chrome_page_obj.print_links_from_page()
    del context.chrome_page_obj


@then(u'Check if page loads with "{link}"')
def step_impl(context, link):
    context.chrome_page_obj.check_document_ready_state(context.url)
    context.chrome_page_obj.click_link_on_page(link)
    height = context.chrome_page_obj.get_window_size()
    scroll_h = height['height']/4
    scroll_h2 = scroll_h * 2
    scroll_h3 = scroll_h * 3
    scroll_h4 = scroll_h * 4
    context.chrome_page_obj.execute_script("window.scrollTo(0," + scroll_h + ")")
    allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name="Chrome_1" + link,
                  attachment_type=AttachmentType.PNG)
    context.chrome_page_obj.execute_script("window.scrollTo(0," + scroll_h2 + ")")
    allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name="Chrome_2" + link,
                  attachment_type=AttachmentType.PNG)
    context.chrome_page_obj.execute_script("window.scrollTo(0," + scroll_h3 + ")")
    allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name="Chrome_3" + link,
                  attachment_type=AttachmentType.PNG)
    context.chrome_page_obj.execute_script("window.scrollTo(0," + scroll_h4 + ")")
    allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name="Chrome_4" + link,
                  attachment_type=AttachmentType.PNG)
