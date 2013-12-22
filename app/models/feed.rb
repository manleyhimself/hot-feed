class Feed < ActiveRecord::Base
  has_many :links

  def pop_it_like_its_hot(hot_list)
    hot_list.pop
  end

end
