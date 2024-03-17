from abc import ABC, abstractmethod

class BrowserDriver(ABC):
    @abstractmethod
    def get_driver(self, driver):
        pass