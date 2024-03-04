from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from scraping_strategy import ScrapingStrategy

class SeleniumStrategy(ScrapingStrategy):
    def scrape(self, symbol):
        driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
        url = f"https://finance.yahoo.com/quote/{symbol}"
        driver.get(url)
        
        previous_close = driver.find_element(By.CSS_SELECTOR, '[data-test="PREV_CLOSE-value"]').text
        open_price = driver.find_element(By.CSS_SELECTOR, '[data-test="OPEN-value"]').text
        volume = driver.find_element(By.CSS_SELECTOR, '[data-test="TD_VOLUME-value"]').text
        market_cap = driver.find_element(By.CSS_SELECTOR, '[data-test="MARKET_CAP-value"]').text
        
        driver.quit()
        
        return {
            'previous_close': previous_close,
            'open_price': open_price,
            'volume': volume,
            'market_cap': market_cap
        }
