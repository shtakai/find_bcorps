# Our CLI Controller
require 'pry'
# require_relative 'states_array'

class FindBCorps::CLI
    
    BASE_URL ='https://bcorporation.net'

    def start 
        puts "--------------------------------------------------------------------\b".colorize(:black)
        puts "Welcome to Find Borps,companies that balance social and environmental purpose with profit".bold.colorize(:black) 
        FindBCorps::Scraper. scrape_listings # a call to scraper class
       # scrape what's on a company's individual profile page
       list_search_choices
    end

    def list_search_choices
        puts "\nChoose your search type below by typing its corresponding number".bold.colorize(:light_blue)
        puts "\n1. List all U.S BCorporations.".colorize(:light_blue)
        puts "\n2. Search for U.S BCorporations by state.".colorize(:light_blue)
        puts "\n3. Seach for U.S BCorporations by products or services offered.".colorize(:light_blue)
       
        input = gets.chomp
        
        if input == "1"
            puts "number 1"
            # list_all_corps
            # elsif input == "2"
            #     # list_by_state
            # elsif input == "3"
            #     # list_by_offerings
        else
         p   "not number 1"
         # list_search_choices again until they get it right.
        end
    end

 #-----BEGIN SCRAPING METHODS ------#
    #scrape the listings page
    def scrape_listings
        listings_page_array = FindBCorps::Scraper.scrape_listings
        # FindBCorps::Corp.create_from_collection(listings_array)
    end

    # def scrape_for_profile
    #     FindBCorps::Corp.profile_array.each do |corp|
    #         profile_hash = FindBCorps::Scraper.scrape_profile_page(BASE_URL + corp.profile_url)
    #         corp.more_attributes(profile_hash)  
    #    end
    # end

    # :location=>"Location: Brooklyn, New York, United States"
#-----END- SCRAPING METHODS -----#

#-----BEGIN LIST/DISPLAY METHODS ------#
    def list_all_corps
        FindBCorps::Corp.listings_page_array.each_with_index(1) do |corp, index|
            puts "#{index}. #{corp.name}"
        end
    end

    def display_by_state
        # puts "which state?"
        # input = gets.chomp('United States')

        # FindBCorps::Scraper.Corp.all.select do |corp|
        #     if input == corp.location
        #          puts "YAY #{corp.name}\n #{corp.location}"          
        #         else
        #         puts "sorry, #{corp.name} \n #{corp.location}"
        #         end
        #     end
        #   puts "----------------------".colorize(:green)
      end

      def display_by_offerings

      end
#-----END LIST or DISPLAY METHODS-----#

end




