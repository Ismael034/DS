from context.scraper_ctx import ScraperContext
from strategy.beautiful_strategy import BeautifulSoupStrategy
from strategy.selenium_strategy import SeleniumStrategy
from rich.table import Table
from rich.console import Console
import json
import datetime

def main():
    print("Welcome to the stock scraper!")
    print("Select a scraping strategy: ")
    print(" 1. BeautifulSoup")
    print(" 2. Selenium\n")
    
    while True:
        choice = input("Enter choice: ")
        if choice.isdigit():
            choice = int(choice)
            if choice == 1:
                context = ScraperContext(BeautifulSoupStrategy(get_json_config()))
                break
            elif choice == 2:
                context = ScraperContext(SeleniumStrategy(get_json_config()))
                break
            else:
                print("Invalid choice. Please try again.")
        else:
            print("Invalid choice. Please try again.")
    
    # Ask for stock symbol
    stock_symbol = input("Enter stock symbol: ")
    scrape_data = context.scrape(stock_symbol)

    try:
        print_table(scrape_data)
        save_to_file(scrape_data)

    except TypeError:
        print("Failed to retrieve the webpage.")

def print_table(scrape_data):
    table = Table(title="\nStock Information at {}".format(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")))
    table.add_column("Close Price")
    table.add_column("Open Price")
    table.add_column("Volume")
    table.add_column("Market Cap")

    table.add_row(
        scrape_data['previous_close'],
        scrape_data['open_price'],
        scrape_data['volume'],
        scrape_data['market_cap']
    )
    console = Console()
    console.print(table)

def save_to_file(scrape_data):
    with open('results.json', 'w') as file:
        # Add timestamp to the file
        scrape_data['timestamp'] = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        file.write(str(scrape_data))
        print("Data saved to results.json")

def get_json_config():
    with open('config.json', 'r') as file:
        return json.load(file)


if __name__ == '__main__':
    main()