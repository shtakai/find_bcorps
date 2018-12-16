# Our CLI Controller
require 'pry'

class FindBCorps::CLI

    attr_accessor :sorted_listings
    BASE_URL ='https://bcorporation.net'

    def greeting
        puts "---------------------------------------------------"
        puts "Thanks for trying the FindBcorps app".upcase
        puts "\nBelow you will find a list of all certified BCorporations in the United States" 
        puts ""
    end

    def start 
        greeting
        make_corp_objects
        sort_listings
        list_corporations
        add_attributes
        choice_prompt
    end

    #-------SCRAPE, MAKE & ADD-------#
    def make_corp_objects
        all_listings = FindBCorps::Scraper.scrape_listings
        FindBCorps::Corp.create_from_listings(all_listings)  
    end
    
    def add_attributes
        FindBCorps::Corp.all_listings.each do |corp|
            profile_attributes = FindBCorps::Scraper.scrape_profile_page(BASE_URL + corp.profile_url)
            corp.add_profile_attributes(profile_attributes)
        end
    end
    #-------END------------#

  #-------LISTINGS---------#
    def sort_listings # Alpha sort will make the list easier to read.
        @sorted_listings = FindBCorps::Corp.all_listings.sort_by{|corp| corp.name}
    end

    # give each corp a number so user can easily reference that company when prompted to.
    def list_corporations
        @sorted_listings.each.with_index(1) do |corp,index|
            puts "#{index}. #{corp.name}"
        end
        
        puts "Read company profile? (Y/N)?"
        input = "nil"
        until input == "Y" || input == "N"
            input = gets.strip.upcase
        end

        if input == "y"
            list_all_details
        else
            puts "you ended"
        end
    end

    def list_states
        @sorted_listings.each.with_index(1) do |state,index|
            puts "#{index}. #{state.location.upcase.bold} -- #{state.name}"
        end
    end

    def list_by_offerings
        puts ""
        puts "Companies and their Services or Products"
        puts ""
        @sorted_listings.each.with_index(1) do |products,index|
            puts "#{index}. #{products.name.upcase.bold} - #{products.offerings}"
        end
    end

      # Individual corp's full details, combining attributes from  both scrapings
    def list_all_details
        FindBCorps::Corp.all_listings.each do |corp|
        
            puts "Company name: #{corp.name.upcase} -- #{corp.location} -- #{corp.website_url}"
            puts "    #{corp.sectors}"
            puts "    Offerings: #{corp.offerings}"
            puts "    #{corp.certified_date}"
            puts "Company Description: #{corp.company_description}"
            puts "---------------------------------------------------"

          
            # @company_description = profile_hash[:company_description]
        end
    end
    #-------END----------#

    #-------PROMPTS------#
    def choice_prompt
        puts ""
        puts "Menu. Enter the corresponding number for your choice".upcase.colorize(:orange)
        puts ""
        puts "1. List BCorp by state.".colorize(:orange)
        puts ""
        puts "2. List BCorp by products or services.".colorize(:orange)
        
        puts ""
        input = gets.strip
        if input == "1"
            list_states
            puts ""
        elsif  input == "2"
            list_by_offerings
            puts "\n---------------------------------------------------"
        end
    end
    #-------END----------#

    def want_more_info
        puts ""
    end
        puts "Read more (Y/N)?"
        input = "nil"
        until input == "Y" || input == "N"
          input = gets.strip.upcase
        end
        if input == "y"
            FindBCorps::Scraper.scrape_profile_page(corp)
        else
          puts "you ended"
        end
      end
end



