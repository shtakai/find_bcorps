
class Scraper

  def self.scrape
   
    doc = Nokogiri::HTML(open('https://bcorporation.net/directory'))
    directory_array = []
 
      doc.css('.node-company.card').each do |company_card|
        scraped_hash = {
           name: company_card.css('.card__title').text,
           offerings: company_card.css('field-name-field-products-and-services').text,
           location: company_card.css('field-name-field-country').text,
           sector: company_card.css('.field-name-field-sector').text,
           go_to_full_profile: company_card.css('.card__inner a').attribute('href').value,
           company_website: company_card.css('.field-name-field-website a').attribute('href').value,
           full_profile_body: company_card.css('.field-name-body p').text
         }

      directory_array << scraped_hash

      # Result from Scraper.scrape = directory_array, which is 
      # an array of hashes; each hash containing information
      # relating to a specific B Company.
    end
    
  end

end
    
