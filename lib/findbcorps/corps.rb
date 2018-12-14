require 'pry'

class FindBCorps::Corp

  attr_accessor :name, :offerings, :location, :profile_url, :certified_date,:sectors,:company_description, :website_url

  @@listings_page_array = []
    # TODO: Want to remove the "United States from returned values in @@all"
  @@profile_array = []
 

  def initialize(listings_page_array)
    listings_page_array.each do |attribute, value| 
      self.send("#{attribute}=",value) 
    end
    @@listings_page_array << self
  end

  def self.listings_page_array
    @@listings_page_array
  end

  def self.profile_array
    @@profile_array 
  end
end

  # def self.create_from_collection(listings_array)
  #   listings_array.each do |corp|
  #     corp = FindBCorps::Corp.new(corp)#calls the initialize method.
     
  #   end
  # end

  # #this hash should be from #scrape_profile_page
  # def self.more_attributes(profile_hash)
  #   profile_hash.each do |key, value| 
  #     self.send("#{key}=", value)
  #   end
  #   @@profile_array << self
  # end
  
# .send : key is coming through as a symbol and we cannot call self.:symbol =
#self.:sector = "food". Ruby didn't know how to make this work.



