import time

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class shop(object):

    def __init__(self):
        self.selfLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        # method name will be converte to keyword name
        print("hello")

    #spaces shoulb de underscored
    @keyword
    def add_items_to_card_and_checkout(self, productsList):
        productsTitles= self.selfLib.get_webelements("css:.card-title")
        i=1
        for product in productsTitles:
            if product.text in productsList:
                self.selfLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
            i=i+1

        time.sleep(10.0)




