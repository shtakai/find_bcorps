require 'pry'

class FindBCorps::Scraper

  def self.scrape_listings
    # USA-only
    index_page = Nokogiri::HTML(open('https://bcorporation.net/directory?search=&industry=&country=United%20States&state=&city='))
    
    scraped_listings_array = []
   
    #iterate over the CS classes one at a time and pull the data within each listing card(e.g. company name, location, etc). Store these into the all_listings.
      index_page.css("div.card__inner").each do |listing_card|
        scraped_listings_array << {
          name: listing_card.css(".heading4.card__title").text,
          offerings: listing_card.css(".field-name-field-products-and-services").text,
          location: listing_card.css(".field-name-field-country").text.gsub!("Location: ", "").gsub!(", United States", ""),
          profile_url: listing_card.css("a").attribute("href").value
          }
      end
      scraped_listings_array
  end

 # Scrape for items in full profile page for details that the listings scrape doesn't have.
  def self.scrape_profile_page(profile_url)
    
    profile_page = Nokogiri::HTML(open(profile_url))

    profile_scrape = {}#this needs to be a hash, not an array.

    profile_page.css(".node-company").each do |detail|
      profile_scrape = {
        certified_date: detail.css(".field-name-field-date-certified").text,
        sectors: detail.css(".field-name-field-sector").text,
        company_description: detail.css(".field-name-body").text,
        website_url: detail.css(".field-name-field-website").text
        }
      end
      
    profile_scrape

  end

end 

