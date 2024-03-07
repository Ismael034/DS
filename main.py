from context.context import Context
from strategy.beautiful_strategy import BeautifulSoupStrategy
from strategy.selenium_strategy import SeleniumStrategy
from rich.table import Table
from rich.console import Console


def main():
    print("Welcome to the stock scraper!")
    print("Select a scraping strategy: ")
    print(" 1. BeautifulSoup")
    print(" 2. Selenium")
    choice = int(input("Enter choice: "))

    if choice == 1:
        context = Context(BeautifulSoupStrategy())
    elif choice == 2:
        context = Context(SeleniumStrategy())
    
    # Ask for stock symbol
    stock_symbol = input("Enter stock symbol: ")
    scrape_data = context.scrape(stock_symbol)

    # Print in a nice format
    table = Table(title="Stock Information")
    table.add_column("Close Price")
    table.add_column("Open Price")
    table.add_column("Volume")
    table.add_column("Market Cap")

    try:
        table.add_row(
            scrape_data['previous_close'],
            scrape_data['open_price'],
            scrape_data['volume'],
            scrape_data['market_cap']
        )
        console = Console()
        console.print(table)
    except TypeError:
        print("Failed to retrieve the webpage.")


if __name__ == '__main__':
    main()