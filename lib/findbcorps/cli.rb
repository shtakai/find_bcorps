# Our CLI Controller
require 'pry'

class FindBCorps::CLI  

    attr_accessor :sorted_listings
    BASE_URL ='https://bcorporation.net'
    
    def start 
        make_corp_objects
        greeting
        add_attributes
    end

    def greeting
        puts "---------------------------------------------------"
        puts "Thank you for trying the FindBcorps app".upcase
        puts "Below you will find a list of all certified BCorporations in the United States."
        list_corporations
    end

    # lists all corps and adds a number to each so that we can ask them to choose which corp they would like to read more about and then take them to that corp's profile page.
    #TODO: Provide a way out if they don't want to see a full profile. Perhaps they would like to see a list of corps in their state.
    def list_corporations
        puts "---------------------------------------------------"
        FindBCorps::Corp.all_listings.each.with_index(1) do |corp_name, index|
            puts "#{index}. #{corp_name.name} "
        end
        which_corp_to_show
    end

    #TODO: Jenn, I don't know how to make this method work so that it takes user's input of the corp it wants full details for and find it in the method.
    def which_corp_to_show
        puts ""
        puts "Which BCorp would you like more information on? Please enter the number corresponding to the corporation"
        input = gets.strip

        FindBCorps::Corp.all_listings.all_listings.find do |corp, index|
            puts "Company name: #{corp.name.upcase} -- #{corp.location} -- #{corp.website_url}"
            puts "    #{corp.sectors}"
            puts "    Offerings: #{corp.offerings}"
            puts "    #{corp.certified_date}"
            puts "Company Description: #{corp.company_description}"
            puts "---------------------------------------------------"
        end
    end

    #TODO:  not sure yet if this method is necessary or if it can be combined with #which_corp_to_show.
    # Show attributes from both listings scrape and the profile scrape.
    def print_profile(corp)
        # puts ""
        # FindBCorps::Corp.all_listings.each.with_index() do |corp, index|
        #     puts "Company name: #{corp.name.upcase} -- #{corp.location} -- #{corp.website_url}"
        #     puts "    #{corp.sectors}"
        #     puts "    Offerings: #{corp.offerings}"
        #     puts "    #{corp.certified_date}"
        #     puts "Company Description: #{corp.company_description}"
        #     puts "---------------------------------------------------"
        # end
    end

    #-------SCRAPE & MAKE.-------#
    def make_corp_objects
        all_listings = FindBCorps::Scraper.scrape_listings
        FindBCorps::Corp.create_from_listings(all_listings)
    end
    
    #this is the 2nd scrape(full profile attributes)
    def add_attributes
        FindBCorps::Corp.all_listings.each do |corp|
            profile_attributes = FindBCorps::Scraper.scrape_profile_page(BASE_URL + corp.profile_url)
            corp.add_profile_attributes(profile_attributes)
        end
    end
    #-------END------------#
end
#____________________#TODO_________________________#
  #-------LISTINGS---------#
  #TODO: The sort method is no longer needed. Update existing references.
    # def list_states
    #     # @sorted_listings.each.with_index(1) do |state,index|
    #     #     puts "#{index}. #{state.location.upcase.bold} -- #{state.name}"
    #     # end
    # end

    # #TODO: Do I want tp give this as an option? What about the list_states option? 
    # def list_offerings
    #     # puts ""
    #     # puts "Companies and their Services or Products"
    #     # puts ""
    #     # @sorted_listings.each.with_index(1) do |products,index|
    #     #     puts "#{index}. #{products.name.upcase.bold} - #{products.offerings}"
    #     # end
    # end
    # #-------END----------#

    #-------PROMPTS/Menus------#
    #-------END----------#
