import allure
from allure_commons.types import AttachmentType


def after_step(context, step):
    if step.status == 'failed':
        step_str = step.name
        allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name=step_str,
                      attachment_type=AttachmentType.PNG)


def before_feature(context, feature):
    if 'web_page_setup' in feature.tags:
        context.excute_steps(u'Open chrome browser and get url "https://www.grunenthal.com"')

