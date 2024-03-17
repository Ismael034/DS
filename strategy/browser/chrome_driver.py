from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from strategy.browser.browser_strategy import BrowserStrategy

class ChromeDriver(BrowserStrategy):
    def __init__(self):
        self.service = Service(ChromeDriverManager().install())
        self.options = Options()
        self.options.add_argument("--headless")
        self.options.add_argument("--start-maximized")

    def get_driver(self):
        return webdriver.Chrome(service=self.service, options=self.options)