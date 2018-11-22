require 'pry'

class Scraper

  def self.scrape_data
    corps_directory = []
    doc = Nokogiri::HTML(open('https://bcorporation.net/directory'))
    doc.css('.node-company.card').each do |company_card|
     company_details = {
        image_url: company_card.css('img').attribute('src').value,
        full_profile_url: company_card.css('a').attribute('href').value,
        name: company_card.css('.card__title').text,
        offerings: company_card.css('field-name-field-products-and-services').text,
        location: company_card.css('field-name-field-country').text
      }
      binding.pry
    end
  end
end
    
    # corps_directory << corps_hash