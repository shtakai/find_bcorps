# Our CLI Controller
require 'pry'
# require_relative 'states_array'

class FindBCorps::CLI
    
    BASE_URL ='https://bcorporation.net'

    def start 
        FindBCorps::Scraper.scrape_listings
        FindBCorps::Scraper.scrape_for_profile
        remove_country
        # greeting
    end

    #scrape the listings page
    def scrape_listings
        listings_array = FindBCorps::Scraper.scrape_listings
        FindBCorps::Scraper.Corp.create_from_collection(listings_array)
    end

    # TODO: Want to remove the "United States from returned values"
    def remove_country(location)
       
    end

    def scrape_for_profile
        FindBCorps::Corp.profile_array.each do |corp|
            profile_hash = FindBCorps::Scraper.scrape_profile_page(BASE_URL + corp.profile_url)
            corp.more_attributes(profile_hash)  
       end
    end

    # :location=>"Location: Brooklyn, New York, United States"

    def display_states
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

    def greeting
        puts "------Welcome to the FindBCorps app------".bold.colorize(:light_blue)
        puts "\nEnter number that corresponds with your search choice".bold.colorize(:light_blue)
        puts    "\n1. Search for BCorporations by state".colorize(:light_blue)
        puts    "\n2. Seach for BCorporations by products or services offered".colorize(:light_blue)
        input = gets.chomp
        # convert to integer if input.to_i.between(1, 52)
        #continue if not accurate, do it again (recursive)
        #until input == exit

            if input == "1"
                display_states

            elsif input == "2"
                puts "This is my name: "
            else
                puts "Goodbye"
            end
    end
    
end




