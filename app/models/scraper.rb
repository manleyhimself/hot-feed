require 'open-uri'

class Scraper < ActiveRecord::Base
  
  def open_url(route)
    Nokogiri::HTML(open("http://www.buzzfeed.com/#{route}"))
  end

  def generate_links_array_helper(feed, route)
    return self.generate_links_array(route,"div.hot-item a.hot-headline") if feed.id == 1 # Feed1 always = hot, unique css path
    return self.generate_links_array(route,"h2#test a") if feed.id == 2 # Feed2 always = entertainment, unique css path
    return self.generate_links_array(route,"div.thumb-unit a") if feed.id >= 3 && feed.id <= 6 # lump together feeds that fit into thumb-unit css path
  end

  def generate_links_array(route, css_path)
    self.open_url(route).css(css_path).collect do |link|
      if link.attr("href").include?("http")
        link.attr("href")
      else
        "http://www.buzzfeed.com#{link.attr("href")}"
      end
    end
  end

  def assign_links_to_feed(feed, route)
    feed.links.destroy_all
    generate_links_array_helper(feed, route).each do |link|
      Link.where(path: link, feed_id: feed.id).first_or_create
    end
  end

end
