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
        puts ""
        puts "Thank you for trying the FindBcorps app".upcase.bold
        puts "Below you will find a list of all certified BCorporations in the United States."
        list_corporations
    end

   # -------LISTINGS----------#
    def list_corporations
        puts "Certified BCorporations in the United States".upcase.bold
        FindBCorps::Corp.all_listings.each.with_index(1) do |corp_name, index|
            puts "#{index}. #{corp_name.name}-- #{corp_name.location}".upcase.bold 
        end

        which_corp_to_show
    end

    def list_by_offerings
        puts ""
        puts "Companies and their Services or Products"
        puts ""
        # @sorted_listings.each.with_index(1) do |products,index|
        #     puts "#{index}. #{products.name.upcase.bold} - #{products.offerings}"
        # end
    end

    def list_by_state
        # @sorted_listings.each.with_index(1) do |state,index|
        # puts "#{index}. #{state.location.upcase.bold} -- #{state.name}"
    end
    #-------END listings----------#

    def which_corp_to_show
        puts ""
        puts "Want more information about a specific BCorp?\n\n".upcase.bold
        puts "Enter the corresponding number to that corporation\n\n".bold
        input = gets.to_i - 1
        # set `corp` equal to that one corp selected from the array of all the corps using the fact that we know the index value: `FindBCorps::Corp.all_listings[index]`
        corp = FindBCorps::Corp.all_listings[input]
        profile_attributes = FindBCorps::Scraper.scrape_profile_page(BASE_URL + corp.profile_url)
        corp.add_profile_attributes(profile_attributes)

        # print out the info about the corp using `corp.name` and so on
        puts "-Profile for #{corp.name}-\n".colorize(:white).on_blue
        puts "Corporation name:".upcase.bold
        puts "#{corp.name}\n \n"
        puts "Location & Website:".upcase.bold 
        puts "#{corp.location},  #{corp.website_url}\n \n"
        puts  "#{corp.sectors}\n \n"
        puts "Products, Services:".upcase.bold
        puts "#{corp.offerings}\n \n"
        puts "#{corp.certified_date}\n \n"
        puts "Company Description:".upcase.bold
        puts "#{corp.company_description}\n"
        
        menu
    end

    def menu
        puts "Would you like to:
            A. View Bcorp listings to choose another BCorp \n
            B. Search for a Bcorp by state\n
            C. Search for BCorps according to products or services\n
            D. Exit"
        input = gets.upcase

        if input == "A"
            list_corporations
        elsif == "B"
            list_by_state
        elsif == "C"
            list_by_offerings
        elsif == "D"
            exit
        else 
            "Please enter the letter that corresponds to your choice of what you would like to do next."
            menu
        end
    end

    #-------PROMPTS/Menus------#
 
    def exit
        "Goodbye. See you soon."
    end
    
end

