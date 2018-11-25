require 'pry'

class Corp
  attr_accessor :name, :offerings, :location, :sector, :go_to_full_profile, :full_profile_body

  @@all = []

  def initialize(hash)
    hash.each do |attribute, value| # "attribute" is equal to "key"
      self.send("#{attribute}=",value) 
    end
    @@all << self
  end

  def self.all
    @@all 
  end

  # This method take the results from Scraper.scrape (an array of hashes) and 
  # iterates over the array. A new object is then created for each iteration with
  # the hash acting as it's argument value.
  def self.create_from_scrape(directory_array)
    directory_array.map do |corp_hash|
      new(corp_hash) # See initialize method above
    end
  end

  # def self.create_from_scrape(array)
  #   array.map do |hash|
  #     new(hash)
  #   end
  # end

  # TODO: how will I get to the correct listing after search selection and list selection? array.match? Should it be in the hash form?
    # multiple companies or 1, but is not full profile 
    # def company_listings 
    #   :name, :location, :sector, :go_to_full_profile, 
    # end    

    # def sector_listings 
    #   :sector 
    # end  
    
    # # one company, all details.    
    # def full_profile 
    #   :name, :offerings, :location, :sector, :full_profile_body
    # end  
end