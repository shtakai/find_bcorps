require 'pry'

class FindBCorps::Corp

  attr_accessor :name, :offerings, :location, :profile_url, :certified_date,:sectors,:company_description, :website_url

  @@just_listings = []
    # TODO: Want to remove the "United States from returned values in @@all"
  @@profile_array = []
 

  def initialize(hash)
    hash.each do |attribute, value| 
      self.send("#{attribute}=",value) 
    end
    @@just_listings << self
  end

  def self.create_from_collection(listings_array)
    listings_array.each do |corp|
      corp = FindBCorps::Corp.new(corp)#calls the initialize method.
     
    end
  end

  #this hash should be from #scrape_profile_page
  def self.more_attributes(profile_hash)
    profile_hash.each do |key, value| 
      self.send("#{key}=", value)
    end
    @@profile_array << self
  end
  
# .send : key is coming through as a symbol and we cannot call self.:symbol =
#self.:sector = "food". Ruby didn't know how to make this work.

  def self.just_listings
    @@all_listings 
  end

  def self.profile_array
    @@profile_array 
  end

end