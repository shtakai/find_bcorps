require 'pry'

class FindBCorps::Corp

  attr_accessor :name, :offerings, :location, :profile_url, :certified_date,:sectors,:company_description, :website_url
 
  @@all_listings = []

  def initialize(listings_hash)
    @name = listings_hash[:name]
    @offerings = listings_hash[:offerings]
    @location = listings_hash[:location]
    @profile_url = listings_hash[:profile_url]
    # The above is the simple way to assign object attributes. A quicker way is doing this below with  (self.send)
    # listings_hash.each do |key, value|
    #    self.send("#{key}=", value)
    #  end
    #basically the above is saying something like'self.name = the key value of :name.
     
    @@all_listings << self
    end
    
    def self.all_listings
      @@all_listings
     end
   

  # create corp objects. This also calls on #initialize
  def self.create_from_listings(all_listings)
    all_listings.each do |corp|
      corp = FindBCorps::Corp.new(corp)#calls the initialize method.
    end
  end

  def add_profile_attributes(profile_hash)
    @certified_date = profile_hash[:certified_date]
    @sectors = profile_hash[:sectors]
    @company_description = profile_hash[:company_description]
    @website_url = profile_hash[:website_url]
  end
end


