require 'pry'

class FindBCorps::Corp

  attr_accessor :name, :offerings, :location, :profile_url, :certified_date,:sectors,:company_description, :website_url

  @@all = []
  @@profile_array = []
 

  def initialize(hash)
    hash.each do |attribute, value| 
      self.send("#{attribute}=",value) 
    end
    @@all << self
  end

  def self.create_from_collection(listings_array)
    listings_array.each do |corp|
      corp = Corp.new(corp)#calls the initialize method.
     
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

  def self.all
    @@all 
  end

  def self.profile_array
    @@profile_array 
  end

end