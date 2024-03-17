from abc import ABC, abstractmethod

class BrowserStrategy(ABC):
    @abstractmethod
    def get_driver(self, driver):
        pass