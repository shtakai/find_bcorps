
# The Command Line Interface Controller
require 'pry'

class FindBCorps::CLI  
  # attr_accessor :all_attributes
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
    puts "\n\nThank you for using the FindBcorps app. Below you will find a list of all certified BCorps in the U.S.\n".bold
    list_corporations
  end

  # -------LISTINGS----------#
  def list_corporations
    puts "Certified BCorporations in the United States:\n".upcase.bold

    FindBCorps::Corp.all_listings.each.with_index(1) do |corp_name,index|
      puts "#{index}.#{corp_name.name}".upcase.bold.blue
      puts "   #{corp_name.location}\n".blue
    end
    which_corp_to_show
  end

  #--------- PROFILES------------
  def which_corp_to_show
    puts "----------------------------"
    puts "If you would like to see more information about a specific company, enter their corresponding number now.\n".upcase.bold
    
    input = gets.strip
    bcorp_count = FindBCorps::Corp.all_listings.count

    if input.to_i > 0 && input.to_i <= bcorp_count
 
      corp = FindBCorps::Corp.all_listings[input.to_i - 1]

      #these are the additional details about corporation from the profile pages.
      profile_attributes = FindBCorps::Scraper.scrape_profile_page(BASE_URL + corp.profile_url)
      corp.add_profile_attributes(profile_attributes)
        
          # print out the info about the specific corp chosen by user.
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
    else
      #error message
      puts "The information you are entering is not working. Please be sure to type the number you see on your screen"
    end

  end

#------------MENU--------------#
  def menu
    puts "What would you like to do next? Enter the corresponding number.".upcase.bold
    puts "1. View all Bcorp listings?"
    puts "2. Exit?"
    puts "----------------------------"
    
    input = gets.to_i
    if input == 1
      list_corporations
    else input == 2
      puts "\n\nYou have successfully exited the program. Thank you!"
      exit
    end
  end
end

#TODO:
# #---------FOR VERSION 2--------------+
# def list_by_offerings
#     puts "We've listed products and services\n".upcase.bold
#     FindBCorps::Corp.all_listings.each.with_index(1) do |corp_offerings, index|
#         puts "#{index}.#{corp_offerings.offerings}".upcase.bold.blue
#     end
#     binding.pry
# puts "Would you like to see that company?"
# end

# # def list_by_state
# #     # @sorted_listings.each.with_index(1) do |state,index|
# #     # puts "#{index}. #{state.location.upcase.bold} -- #{state.name}"
# # end
# # #-------END listings----------#



