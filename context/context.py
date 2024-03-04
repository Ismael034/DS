
class Context:
    def __init__(self, strategy):
        self._strategy = strategy
        pass

    def set_strategy(self, strategy):
        self._strategy = strategy
        pass

    def scrape(self, url):
        self._strategy.scrape(url)
        pass