# Our CLI Controller
require 'pry'

class CLI
    def call
        directory_array = Scraper.scrape
        Corp.create_from_scraper(directory_array) 
        # or Corp.create_from_scrape(Scraper.scrape)
        greeting
      
    end

    def greeting
        puts "Welcome to the FindBCorps app, where you can search for certified BCorps, a new kind of business that balances purpose and profit. Before you shop,  or job search, why not consider using a BCorp."

    end

end

    