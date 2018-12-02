require 'pry'


class Scraper

  def self.scrape_for_listings
    # USA search only. Using the url from website's location filter
    directory_page = Nokogiri::HTML(open('https://bcorporation.net/directory?search=&industry=&country=United%20States&state=&city='))
    
    listings_scrape = []
   
    directory_page.css("div.card__inner").each do |listing|
      listings_scrape << {
        name: listing.css(".card__text .heading4.card__title").text
        # binding.pry
        # offerings: listing.css(".card__text, .field-name-field-products-and-services").text,
        # location: listing.css(".card__text .field-name-field-country").text,
        # profile_url: listing.css("a").attribute("href").value
        }
        
      end
      
      listings_scrape
   
  end

 # Scrape full profile page for the details that the directory listings page doesn't have. This should add those attributes to the hash.
  def self.scrape_profile_page(profile_url)
    
    profile_page = Nokogiri::HTML(open(profile_url))

    profile_scrape = []

    profile_page.css(".node-company").each do |detail|
      profile_scrape << {
        certified_date: detail.css(".field-name-field-date-certified").text,
        sectors: detail.css(".field-name-field-sector").text,
        company_description: detail.css(".field-name-body").text,
        website_url: detail.css(".field-name-field-website").text
        
        }
        
      end
      
    profile_scrape
    
  end

end 


