from behave import *
from chrome.ChromeDriverPage import ChromeDriverPage
from hamcrest import *


@then(u'Open "{browser}" browser and get url "{url}"')
def step_impl(context, browser, url):
    if ("chrome" or "Chrome" or "CHROME") in browser:
        chrome_page_obj = ChromeDriverPage(context.device_id)
        chrome_page_obj.dismiss_message_box_if_any()
        chrome_page_obj.get_web_page_using_chrome_browser(url)
        chrome_page_obj.save_chrome_web_page_screenshot()
        context.chrome_page_obj = chrome_page_obj


@then(u'Check if page loads with "{title}" and click "{no_links}" dynamic links')
def step_impl(context, title, no_links):
    context.chrome_page_obj.dismiss_message_box_if_any()
    context.chrome_page_obj.check_document_ready_state(title)
    print(context.chrome_page_obj.get_web_page_source())
    var = context.chrome_page_obj.find_if_any_error_in_chrome_page()
    print("Page" + str(var))
    title = title.lower()
    assert_that(context.chrome_page_obj.get_web_page_source(), contains_string(title), raises(ValueError, title))
    context.chrome_page_obj.get_links_from_page()
    context.chrome_page_obj.click_links_from_page(int(no_links))
    context.chrome_page_obj.save_chrome_web_page_screenshot()
    del context.chrome_page_obj
