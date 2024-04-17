from selenium import webdriver
from selenium.webdriver import FirefoxOptions
from selenium.webdriver.firefox.service import Service
from webdriver_manager.firefox import GeckoDriverManager
from strategy.browser.browser_strategy import BrowserStrategy

class FirefoxDriver(BrowserStrategy):
    def __init__(self):
        self.service = Service(GeckoDriverManager().install())
        self.options = FirefoxOptions()
        self.options.add_argument("--headless")
        self.options.add_argument("--start-maximized")
        self.options.add_argument("--kiosk")

    def get_driver(self):
        return webdriver.Firefox(service=self.service, options=self.options)