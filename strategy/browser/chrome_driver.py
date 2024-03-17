from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from strategy.browser.browser_driver import BrowserDriver

class ChromeDriver(BrowserDriver):
    def __init__(self, config):
        self.config = config
        self.service = Service(ChromeDriverManager().install())
        self.options = Options()
        self.options.add_argument("--headless")
        self.options.add_argument("--start-maximized")
        self.wait = WebDriverWait

    def get_driver(self):
        return webdriver.Chrome(service=self.service, options=self.options)