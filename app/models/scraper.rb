require 'open-uri'

#TODO: DRY THIS UP!
class Scraper < ActiveRecord::Base
  
  def get_hotness
    Nokogiri::HTML(open("http://www.buzzfeed.com/hot")) 
  end

  def get_entertainment
    Nokogiri::HTML(open("http://www.buzzfeed.com/entertainment"))
  end

  def get_diy
    Nokogiri::HTML(open("http://www.buzzfeed.com/diy"))
  end

  def get_animals
    Nokogiri::HTML(open("http://www.buzzfeed.com/animals"))
  end

  def get_rewind
    Nokogiri::HTML(open("http://www.buzzfeed.com/rewind"))
  end

  def get_politics
    Nokogiri::HTML(open("http://www.buzzfeed.com/politics"))
  end

  def generate_links_array_helper(feed)
    return self.generate_hot_array if feed.id == 1
    return self.generate_entertain_array if feed.id == 2
    return self.generate_animal_array if feed.id == 3
    return self.generate_diy_array if feed.id == 4
    return self.generate_rewind_array if feed.id == 5
    return self.generate_politics_array if feed.id == 6
  end

  def generate_politics_array
    get_politics.css("div.thumb-unit a").collect do |link|
      if link.attr("href").include?("http")
        link.attr("href")
      else
        "http://www.buzzfeed.com#{link.attr("href")}"
      end
    end
  end

  def generate_diy_array
    get_diy.css("div.thumb-unit a").collect do |link|
      if link.attr("href").include?("http")
        link.attr("href")
      else
        "http://www.buzzfeed.com#{link.attr("href")}"
      end
    end
  end

  def generate_animal_array
    get_animals.css("div.thumb-unit a").collect do |link|
      if link.attr("href").include?("http")
        link.attr("href")
      else
        "http://www.buzzfeed.com#{link.attr("href")}"
      end
    end
  end

   def generate_rewind_array
    get_rewind.css("div.thumb-unit a").collect do |link|
      if link.attr("href").include?("http")
        link.attr("href")
      else
        "http://www.buzzfeed.com#{link.attr("href")}"
      end
    end
  end

  def generate_hot_array
    get_hotness.css("div.hot-item a.hot-headline").collect do |link|
      if link.attr("href").include?("http")
        link.attr("href")
      else
        "http://www.buzzfeed.com#{link.attr("href")}"
      end
    end
  end 

  def generate_entertain_array
    get_entertainment.css("h2#test a").collect do |link|
      if link.attr("href").include?("http")
        link.attr("href")
      else
        "http://www.buzzfeed.com#{link.attr("href")}"
      end
    end
  end

  def assign_links_to_feed(feed)
    feed.links.destroy_all
    generate_links_array_helper(feed).each do |link|
      Link.where(path: link, feed_id: feed.id).first_or_create
    end
  end

 

end
