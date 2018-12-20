# Our CLI Controller
require 'pry'

class FindBCorps::CLI  

    attr_accessor :all_attributes
    BASE_URL ='https://bcorporation.net'
    
    def start 
        make_corp_objects
        greeting
    end

      #-------SCRAPE & MAKE.-------#
      def make_corp_objects
        all_listings = FindBCorps::Scraper.scrape_listings
        FindBCorps::Corp.create_from_listings(all_listings)
    end

    def greeting
        puts "\n\nThank you for trying the FindBcorps app. Below you will find a list of all certified BCorporations in the United States.\n".bold
        list_corporations
    end

    # -------LISTINGS----------#
    def list_corporations
        puts "Certified BCorporations in the United States:\n".upcase.bold
         FindBCorps::Corp.all_listings.each.with_index(1) do |corp_name, index|
            puts "#{index}.#{corp_name.name}".upcase.bold.blue
            puts "   #{corp_name.location}\n".blue
         end
        which_corp_to_show
     end

    def which_corp_to_show
        puts "----------------------------"
        puts "Which company would you like to view more information about?\n".upcase.bold
        input = gets.to_i - 1
        # set `corp` equal to that one corp selected from the array of all the corps using the fact that we know the index value: `FindBCorps::Corp.all_listings[index]`
        corp = FindBCorps::Corp.all_listings[input]
        profile_attributes = FindBCorps::Scraper.scrape_profile_page(BASE_URL + corp.profile_url)
        corp.add_profile_attributes(profile_attributes)

        # print out the info about the corp using `corp.name` and so on
        puts "Corporation name:".upcase.bold.blue
        puts "#{corp.name}\n\n"
        puts "Location:".upcase.bold.blue
        puts "#{corp.location}\n\n"
        puts "Sector, Industry:".upcase.bold.blue
        puts  "#{corp.sectors}\n\n"
        puts "Products, Services:".upcase.bold.blue
        puts "#{corp.offerings}\n\n"
        puts "Certification Date:".upcase.bold.blue
        puts "#{corp.certified_date}\n\n"
        puts "Company Description:".upcase.bold.blue
        puts "#{corp.company_description}\n"
        puts "Website:".upcase.bold.blue
        puts "#{corp.website_url}\n\n"
        puts "----------------------------"
        menu
    end

    def menu
        puts "What would you like to do next?
            1. View all Bcorp listings
            2. Exit"
            puts "----------------------------"
        input = gets.to_i

        if input == 1
            list_corporations
        else input == 2
            puts "\n\nThank you! Goodbye"
            exit
        end
    end
   
    #---------FOR VERSION 2--------------+
    # def list_by_offerings
    #     puts ""
    #     puts "Companies and their Services or Products"
    #     puts ""
    #     # @sorted_listings.each.with_index(1) do |products,index|
    #     #     puts "#{index}. #{products.name.upcase.bold} - #{products.offerings}"
    #     # end
    # end

    # def list_by_state
    #     # @sorted_listings.each.with_index(1) do |state,index|
    #     # puts "#{index}. #{state.location.upcase.bold} -- #{state.name}"
    # end
    # #-------END listings----------#
    
end

