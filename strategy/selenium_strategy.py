from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from strategy.scraping_strategy import ScrapingStrategy
from context.browser_ctx import BrowserContext
from strategy.browser.chrome_driver import ChromeDriver
from strategy.browser.firefox_driver import FirefoxDriver

class SeleniumStrategy(ScrapingStrategy):
    def __init__(self, config):
        self.url = f"{config['config']['base_url']}"
        self.cookies = config['config']['cookie_xpath']
        self.wait = config['config']['wait']
        self.config = config

        self.result = {}
        self.driver = BrowserContext(self.get_driver()).get_driver()
        
    def get_driver(self):
        print("Select a browser: ")
        print(" 1. Chrome")
        print(" 2. Firefox\n")
        
        while True:
            choice = input("Enter choice: ")
            if choice.isdigit():
                choice = int(choice)
                if choice == 1:
                    return ChromeDriver(self.config).get_driver()
                elif choice == 2:
                    return FirefoxDriver(self.config).get_driver()
                else:
                    print("Invalid choice. Please try again.")
            else:
                print("Invalid choice. Please try again.")
        

    def find_element(self, driver, element):
        try:
            return driver.find_element(By.CSS_SELECTOR, element).text
        except AttributeError:
            return None
        
    def scrape(self, symbol):
        self.url = f"{self.url}/{symbol}"
        self.driver.get(self.url)

        WebDriverWait(self.driver, self.wait).until(EC.element_to_be_clickable((By.XPATH,self.cookies)))
        cookie_element = self.driver.find_element(By.XPATH, self.cookies)
        self.driver.execute_script("arguments[0].click();", cookie_element)

        try:
            WebDriverWait(self.driver, self.wait).until(EC.presence_of_element_located((By.CSS_SELECTOR, self.config['Selenium']['previous_close'])))
        except:
            return 'Failed to retrieve the webpage.'

        for key, value in self.config['Selenium'].items():
            self.result[key] = self.find_element(self.driver, value)
        
        self.driver.quit()
        return self.result