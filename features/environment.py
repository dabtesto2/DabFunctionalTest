import allure
from allure_commons.types import AttachmentType


def before_feature(context, feature):
    if 'android_s8_web_page_chrome_setup' in feature.tags:
        context.execute_steps('''
                                Given Open chrome browser get url "https://www.grunenthal.com" using "s8"
                                ''')
    if 'ios_iphone8_web_page_safari_setup' in feature.tags:
        context.execute_steps('''
                                Given Open safari browser get url "https://www.grunenthal.com" using "iphone8"
                                ''')
    if 'ios_ipad_mini_web_page_safari_setup' in feature.tags:
        context.execute_steps('''
                                Given Open safari browser get url "https://www.grunenthal.com" using "caecc423e608824f597d8a3dbc382b3addc0382f"
                                ''')


def after_step(context, step):
    if step.status == 'failed':
        step_str = step.name
        if context.chrome_page_obj is None:
            pass
        else:
            allure.attach(context.chrome_page_obj.save_chrome_web_page_screenshot(), name=step_str,
                          attachment_type=AttachmentType.PNG)
