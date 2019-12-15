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
        allure.attach(chrome_page_obj.save_chrome_web_page_screenshot(), name="Chrome_page",
                      attachment_type=AttachmentType.PNG)
        context.chrome_page_obj = chrome_page_obj


@then(u'Check if page loads with "{title}" and click "{no_links}" links without error "{error}"')
def step_impl(context, title, no_links, error):
    context.chrome_page_obj.dismiss_message_box_if_any()
    context.chrome_page_obj.check_document_ready_state(title)
    assert_that(context.chrome_page_obj.check_for_chrome_page_timeout(),
                is_not(error.lower()),
                "Chrome Browser Page Timeout Occured when loading URL")
    assert_that(not context.chrome_page_obj.check_for_reload_button_in_chrome_page(),
                "Chrome Browser Page Timeout Occured with Reload Option")
    title = title.lower()
    assert_that(context.chrome_page_obj.get_web_page_source(), contains_string(title), raises(ValueError, title))
    context.chrome_page_obj.get_links_from_page()
    context.chrome_page_obj.click_links_from_page(no_links)
    allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name="Chrome_" + title,
                  attachment_type=AttachmentType.PNG)
    del context.chrome_page_obj


@then(u'if url in blacklist then user is blocked with "{error}" or redirected to page "{content}"')
def step_impl(context, error, content):
    if_error_reset = context.chrome_page_obj.check_for_chrome_page_connection_reset()
    if_error_access_denied = context.chrome_page_obj.check_for_chrome_page_access_denied()
    any_of(assert_that(if_error_reset, contains_string(error.lower())),
           assert_that(if_error_access_denied, contains_string(content.lower())))
    allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name="blocked",
                  attachment_type=AttachmentType.PNG)