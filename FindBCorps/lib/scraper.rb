
class Scraper

  def self.scrape
    # store companies and their details here?. 
    corps_directory = []

    # scrape this web page and iterate over each of their details and store them in the corps_directory array
    doc = Nokogiri::HTML(open('https://bcorporation.net/directory'))
    doc.css('.node-company.card').each do |company_card|
     company_details = {
        image_url: company_card.css('img').attribute('src').value,
        full_profile_url: company_card.css('a').attribute('href').value,
        name: company_card.css('.card__title').text,
        offerings: company_card.css('field-name-field-products-and-services').text,
        location: company_card.css('field-name-field-country').text
      }
      # push company_details hash into the corps_directory array.
      corps_directory << company_details
    end
  end
end
    
 