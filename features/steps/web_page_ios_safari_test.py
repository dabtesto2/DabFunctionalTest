import allure
from allure_commons.types import AttachmentType
from behave import then, Given

from iospages.iOSDevice import iOSDevice
from iospages.safari.SafariDriver import SafariPage


@Given(u'Open safari browser get url "{url}" using "{model}"')
def step_impl(context, url, model):
    context.url = url
    ios_obj = iOSDevice(model)
    safari_page_obj = SafariPage(ios_obj)
    safari_page_obj.get_web_page_using_safari_browser(url)
    safari_page_obj.check_safari_document_ready_state(context.url)
    #safari_page_obj.safari_find_element_containing_link_and_click("Ok, continue to the website")
    context.safari_page_obj = safari_page_obj
    allure.attach(safari_page_obj.save_safari_web_page_screenshot(), name="Web Page",
                  attachment_type=AttachmentType.PNG)


@then(u'print links from safari page')
def step_impl(context):
    context.safari_page_obj.print_links_from_safari_page()
    del context.safari_page_obj


@then(u'Check if safari page loads with "{link}"')
def step_impl(context, link):
    context.safari_page_obj.click_link_on_safari_page(link)
    safari_page_height = context.safari_page_obj.get_safari_page_height()
    scroll_list = list(map(lambda x: int(x * (safari_page_height / 8)), [0, 1, 2, 3, 4, 5, 6, 8, 9, 10]))
    # x_position = int(safari_page_height / 10)
    x_position = 0
    for y_position in scroll_list:
        file = "Safari_{}_{}".format(y_position, link)
        context.safari_page_obj.safari_scroll_to_page(x_position, y_position)
        allure.attach(context.safari_page_obj.save_safari_web_page_screenshot(), name=file,
                      attachment_type=AttachmentType.PNG)
