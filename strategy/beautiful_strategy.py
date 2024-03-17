import requests
from bs4 import BeautifulSoup
from strategy.scraping_strategy import ScrapingStrategy 

class BeautifulSoupStrategy(ScrapingStrategy):
    def __init__(self, config):
        self.result = {}
        self.config = config
        self.url = f"{config['config']['base_url']}"

    def find_element(self, soup, element):
        try:
            return soup.find('td', element).text.strip()
        except AttributeError:
            return None
        
    def scrape(self, symbol):
        self.url = f"{self.url}/{symbol}"
        response = requests.get(self.url)

        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')
            
            for key, value in self.config['BeautifulSoup'].items():
                self.result[key] = self.find_element(soup, value)
            return self.result
        
        else:
            return 'Failed to retrieve the webpage.'
