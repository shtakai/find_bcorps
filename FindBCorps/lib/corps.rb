require 'pry'

class Corp
  attr_accessor :name, :offerings, :location, :sector, :go_to_full_profile, :full_profile_body, :image_url

  @@all = []

  def initialize(hash)
    hash.each do |key, value|
      self.send("#{key}=",value) 
    end
    @@all << self
  end

  def self.all
    @@all 
  end

end