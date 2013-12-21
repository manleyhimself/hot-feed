require 'open-uri'

class Scraper < ActiveRecord::Base
  
  def get_hotness
    Nokogiri::HTML(open("http://www.buzzfeed.com/hot")) 
  end

  def generate_links_array
    get_hotness.css("div.hot-item a.hot-headline").collect do |link|
      if link.attr("href").include?("http")
        link.attr("href")
      else
        "http://www.buzzfeed.com#{link.attr("href")}"
      end
    end
  end 

 

end
