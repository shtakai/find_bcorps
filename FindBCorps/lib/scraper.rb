
class Scraper

  def self.scrape
    # TODO: store companies and their details here?????. 
    corps_directory = []

    # scrape this web page and iterate over each of their details and store them in the corps_directory array
    doc = Nokogiri::HTML(open('https://bcorporation.net/directory'))
    doc.css('.node-company.card').each do |company_card|
     company_details = {
        go_to_full_profile: company_card.css('.card__inner a').attribute('href').value,
        company_website: company_card.css('.field-name-field-website a').attribute('href').value,
        name: company_card.css('.card__title').text,
        sector: company_card.css('.field-name-field-sector').text,
        offerings: company_card.css('field-name-field-products-and-services').text,
        full_profile_body: company_card.css('.field-name-body p').text,
        location: company_card.css('field-name-field-country').text
      }
      # TODO: push company_details hash into the corps_directory array.
      corps_directory << company_details
    end
  end
end
    
 