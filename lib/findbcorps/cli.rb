# Our CLI Controller
require 'pry'
# require_relative 'states_array'

class FindBCorps::CLI
    
    BASE_URL ='https://bcorporation.net'

    def start 
        puts "--------------------------------------------------------------------\b".colorize(:black)
        puts "Welcome to Find Borps,companies that balance social and environmental purpose with profit".bold.colorize(:black) 
        # scrape_listings # a call to scraper class
        # scrape what's on a company's individual profile page
        # list search_choices
    end

    def list_search_choices
        puts "\nChoose your search type below by typing its corresponding number".bold.colorize(:light_blue)
        puts "\n1. Search for U.S BCorporations by state.".colorize(:light_blue)
        puts "\n2. Seach for U.S BCorporations by products or services offered.".colorize(:light_blue)
        puts "\n3. List all U.S BCorporations.".colorize(:light_blue)
        puts "------------------------------------------------------------------\b".colorize(:black)
        input = gets.chomp
        
        if input == "1"
            # display_by_state
        elsif input == "2"
            # list products_services
        elsif input == "3"
            # list_all_corps"
        else
            # list_search_choices again until they get it right.
        end
    end

    #-----SCRAPING METHODS BEGIN------#
    #scrape the listings page
    def scrape_listings
        listings_array = FindBCorps::Scraper.scrape_listings
        FindBCorps::Corp.create_from_collection(listings_array)
        binding.pry
    end

    # def scrape_for_profile
    #     FindBCorps::Corp.profile_array.each do |corp|
    #         profile_hash = FindBCorps::Scraper.scrape_profile_page(BASE_URL + corp.profile_url)
    #         corp.more_attributes(profile_hash)  
    #    end
    # end

    # :location=>"Location: Brooklyn, New York, United States"
     #-----SCRAPING METHODS END------#

    def list_all_corps

    end

    def display_by_state
        puts "which state?"
        input = gets.chomp('United States')

        FindBCorps::Scraper.Corp.all.select do |corp|
            if input == corp.location
                 puts "YAY #{corp.name}\n #{corp.location}"          
                else
                puts "sorry, #{corp.name} \n #{corp.location}"
                end
            end
          puts "----------------------".colorize(:green)
      end

end




