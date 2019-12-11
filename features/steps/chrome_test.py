import allure
from allure_commons.types import AttachmentType
from behave import *
from chrome.ChromeDriverPage import ChromeDriverPage
from hamcrest import *
import re


@then(u'Open "{browser}" browser and get url "{url}"')
def step_impl(context, browser, url):
    if ("chrome" or "Chrome" or "CHROME") in browser:
        chrome_page_obj = ChromeDriverPage(context.device_id)
        chrome_page_obj.dismiss_message_box_if_any()
        chrome_page_obj.get_web_page_using_chrome_browser(url)
        allure.attach('step-:check data downloaded', context.chrome_page_obj.save_chrome_web_page_screenshot(),
                      AttachmentType.PNG)
        context.chrome_page_obj = chrome_page_obj


@then(u'Check if page loads with "{title}" and click "{no_links}" dynamic links')
def step_impl(context, title, no_links):
    context.chrome_page_obj.dismiss_message_box_if_any()
    context.chrome_page_obj.check_document_ready_state(title)
    allure.attach('step-:check data downloaded', context.chrome_page_obj.save_chrome_web_page_screenshot(),
                  AttachmentType.PNG)
    context.chrome_page_obj.save_chrome_web_page_screenshot()
    assert_that(context.chrome_page_obj.check_for_errors_in_chrome_page(),
                is_not("ERR_TIMED_OUT".lower()),
                "Chrome Browser Page Timeout Occured when loading URL")
    assert_that(not context.chrome_page_obj.check_for_reload_button_in_chrome_page(),
                "Chrome Browser Page Timeout Occured with Reload Option")
    assert_that(context.chrome_page_obj.check_for_errors_in_chrome_page(),
                is_not("ERR_TIMED_OUT".lower()),
                "Chrome Browser Page Timeout Occured when loading URL")
    title = title.lower()
    assert_that(context.chrome_page_obj.get_web_page_source(), contains_string(title), raises(ValueError, title))
    context.chrome_page_obj.get_links_from_page()
    context.chrome_page_obj.click_links_from_page(no_links)
    del context.chrome_page_obj
