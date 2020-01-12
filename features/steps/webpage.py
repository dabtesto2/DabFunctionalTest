import allure
from allure_commons.types import AttachmentType
from behave import then, Given
from chrome.ChromeDriverPage import ChromeDriverPage


@Given(u'Open chrome browser get url "{url}" using "{device}"')
def step_impl(context, url, device):
    context.url = url
    chrome_page_obj = ChromeDriverPage(device)
    chrome_page_obj.get_web_page_using_chrome_browser(url)
    chrome_page_obj.chrome_find_element_containing_text_and_click("Ok, continue to the website")
    context.chrome_page_obj = chrome_page_obj


@then(u'print links from page')
def step_impl(context):
    context.chrome_page_obj.print_links_from_page()
    del context.chrome_page_obj


@then(u'Check if page loads with "{link}"')
def step_impl(context, link):
    context.chrome_page_obj.check_document_ready_state(context.url)
    context.chrome_page_obj.click_link_on_page(link)
    chrome_page_height = context.chrome_page_obj.get_page_height()
    scroll_list = list(map(lambda x: int(x * (chrome_page_height / 8)), [0, 1, 2, 3, 4, 5, 6, 7, 8]))
    x_position = int(chrome_page_height / 8)
    for y_position in scroll_list:
        file = "Chrome_{}_{}".format(y_position, link)
        context.chrome_page_obj.chrome_scroll_to_page(x_position, y_position)
        allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name=file,
                      attachment_type=AttachmentType.PNG)
