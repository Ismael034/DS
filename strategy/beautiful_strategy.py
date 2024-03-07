import requests
from bs4 import BeautifulSoup
from strategy.scraping_strategy import ScrapingStrategy 

class BeautifulSoupStrategy(ScrapingStrategy):
    def scrape(self, symbol):
        url = f"https://finance.yahoo.com/quote/{symbol}"
        response = requests.get(url)
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')
            
            try:
                previous_close = soup.find('td', {'data-test': 'PREV_CLOSE-value'}).text.strip()
                open_price = soup.find('td', {'data-test': 'OPEN-value'}).text.strip()
                volume = soup.find('td', {'data-test': 'TD_VOLUME-value'}).text.strip()
                market_cap = soup.find('td', {'data-test': 'MARKET_CAP-value'}).text.strip()
            except AttributeError:
                return None

            return {
                'previous_close': previous_close,
                'open_price': open_price,
                'volume': volume,
                'market_cap': market_cap
            }
        else:
            return 'Failed to retrieve the webpage.'
