require 'pry'

class Corp
  
  attr_accessor :name, :offerings, :location, :profile_url, :certified_date,:sectors,:company_description, :website_url

  @@all = []

  def initialize(hash)
    hash.each do |attribute, value| 
      self.send("#{attribute}=",value) 
    end
    @@all << self
  end

  def self.create_from_collection(listings_array)
    listings_array.each do |c|
      corp = Corp.new(c)
    end
  end

  def add_attributes
    # make sure that the details from full profile can be read or used for full profile display.


  end

  end
  # def attributes_from_profile_scrape(array)
  #   profile_hash.each do |p|
  #     p = Corp.new(p)
  #   end
  # end

  def self.all
    @@all 
  end
  
end