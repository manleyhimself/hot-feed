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

  def assign_links_to_feed
    feed = Feed.where(id: 1).first_or_create
    feed.links.destroy_all
    generate_links_array.each do |link|
      Link.where(path: link, feed_id: feed.id).first_or_create
    end
  end

 

end
