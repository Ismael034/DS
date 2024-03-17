class BrowserContext:
    def __init__(self, driver):
        self._driver = driver
        pass

    def get_driver(self):
        return self._driver
