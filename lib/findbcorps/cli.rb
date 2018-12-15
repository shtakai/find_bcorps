# Our CLI Controller
require 'pry'

class FindBCorps::CLI

    attr_accessor :sorted_listings

    #BASE_URL will be passed in for the individual profile pages of each corporation
    BASE_URL ='https://bcorporation.net'

    def greeting
        puts "---------------------------------------------------"
        puts "Thanks for trying the FindBcorps app".upcase
        puts "\nBelow you will find a list of all certified U.S BCorporations:" 
        puts ""
    end

    def start 
        greeting
        make_corp_objects
        sort_listings
        list_corporations
        # choice_prompt
        # add_profile
        # display_offerings
    end

    def make_corp_objects
        all_listings = FindBCorps::Scraper.scrape_listings
        FindBCorps::Corp.create_from_listings(all_listings)  
    end

     # Alpha sort will make the list easier to read.
    def sort_listings
        @sorted_listings = FindBCorps::Corp.all_listings.sort_by{|corp| corp.name}
     end

    def list_corporations
        FindBCorps::Corp.all_listings.each_with_index(1) do |corp,index|
            puts "#{index} #{corp.name}"
        end
    end

    def list_by_state
        puts "Listed by state:"
        @sorted_listings.each do |corp|
            corp.location
        end
    end

    def list_by_offerings
        @sorted_listings.select do |corp|
            corp.offerings
        end
    end
    
    def choice_prompt
        puts "---------------------------------------------------"
        puts "\nNarrow your search by state or by offerings (products and services)".bold.colorize(:green)
        puts "\n1. List BCorp by state.".colorize(:green)
        puts "\n2. List BCorp by products or services.".colorize(:green)
        puts "\n---------------------------------------------------"
        input = gets.strip
        if input == "1"
            puts "In which state would you like to search?"
            #return companies by state input by user.
        else
          list_by_offerings
         puts "---------------------------------------------------"
        end
    end

end



