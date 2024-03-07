from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from strategy.scraping_strategy import ScrapingStrategy

class SeleniumStrategy(ScrapingStrategy):
    def scrape(self, symbol):
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        chrome_options.add_argument("--start-maximized")

        driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
        url = f"https://finance.yahoo.com/quote/{symbol}"
        driver.get(url)
        
        WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH,'//*[@id="consent-page"]/div/div/div/form/div[2]/div[2]/button[1]'))).click()

        try:
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
        except Exception as e:
            driver.quit()
            return None