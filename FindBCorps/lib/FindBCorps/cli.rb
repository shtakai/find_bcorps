# Our CLI Controller
require 'pry'

class CLI

    # base = https://bcorporation.net/directory

    def call 
       create_corp
        greeting
    end

    def create_corp
        listings_array = Scraper.scrape_for_listings
        Corp.create_from_collection(listings_array)
    end

    # def add_attributes_to_corp
    #     Corp.all.each do |corp|
    #       attributes = Scraper.scrape_profile_page(BASE_PATH + Corp.profile_url)
    #       corp.add_corp_attributes(attributes)
    #     end
    # end

    def greeting
        puts ""
        puts "------Welcome to the FindBCorps app. Before you shop, why not consider shopping at a BCorporation and vote for responsible businesses that balance profit with purpose.------"
        puts ""
    end

end



