from abc import ABC, abstractmethod

class ScrapingStrategy(ABC):
    @abstractmethod
    def scrape(self, symbol):
        pass