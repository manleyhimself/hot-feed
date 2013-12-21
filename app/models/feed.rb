class Feed < ActiveRecord::Base

  def self.pop_it_like_its_hot(hot_list)
    hot_list.pop
  end

end
