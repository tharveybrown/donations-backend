require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  def scrape_top_pages
    urls = [
      'https://www.impactmatters.org/top-lists/education/', 
      'https://www.impactmatters.org/top-lists/health/',
      'https://www.impactmatters.org/top-lists/homelessness/',
      'https://www.impactmatters.org/top-lists/veterans/',
      # 'https://www.impactmatters.org/ratings/?stars=5',
      'https://www.impactmatters.org/top-lists/climate-change/'
    ]
    scrape_org_pages(urls)
  end

  def scrape_org_pages(urls)
    orgs_list = []
    urls.each do |url|
      html = open(url)
      doc = Nokogiri::HTML(html)
      
      nonprofits = doc.css('.rating-card')
      nonprofits.each do |org| 
        name = org.css('.nonprofit-title')[0].children.text
        summary = org.css('.nonprofit-value').children.text
        donation_url = org.css('.btn-orange').attribute('href').value
        parsed_url = URI.parse(donation_url)
        website_url = parsed_url.scheme + "://" + parsed_url.hostname
        category = URI.parse(url).path.split("/").last
        orgInfo = {
          name: name,
          description: summary,
          donate: donation_url,
          website: website_url,
          category: category,
        }
        orgs_list << orgInfo

      end
    end

    
    orgs_list
  end


end



# scrape = Scraper.new
# scrape.scrape_top_pages