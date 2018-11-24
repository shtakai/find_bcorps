# Our CLI Controller
require 'pry'

class CLI
    def call
        greeting
    end

    def greeting
        puts "Welcome to the FindBCorps app, where you can search for certified BCorps, a new kind of business that balances purpose and profit. Before you shop,  or job search, why not consider using a BCorp."

        choose_search
    end

    def choose_search
        puts "Would you like to try a simple search (company name only), or by details (i.e. by industry,location, or product/service)?\n
            (1) Simple search (company name only\n 
            (2) Details search (i.e. by industry,location, or product/service)" 

        search_type_input = gets.strip.to_i

        # simple search == 1
        if search_type_input == 1
            simple_search

        # details search == 2 
        elsif search_type_input == 2
            details_search

        # user entered illegal number so ask again
        else
            puts "Incorrect entry." 
            choose_search
        end
        
    end

    def simple_search
         puts "Enter company name"
         simple_input = gets
         # TODO HOW to return company matching the name if it exists. If it doesn't, ask for fewer letters or another name. Also ask if user would like to try a detailed search instead.

    end

    # TODO:detailed_search: replace with a method once it's created.
    def details_search
        list_attributes # method not created yet
        details_input = gets
    end
    
    def list_attributes


    end

    # TODO: how will I get to the correct listing after search selection and list selection? array.match? Should it be in the hash form?
    # multiple companies or 1, but is not full profile 
    def company_listings 

    end         
    
    # one company, all details.    
    def full_company_profile 

    end           
end
# class FindBCorps::CLI
    
# end