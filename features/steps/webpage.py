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
    scroll_list = list(map(lambda x:int(x*(height['height']/4)) , [1.5,2,2.5,3,3.5,4]))
    print(scroll_list)