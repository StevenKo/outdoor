class CollectUserPostShip < ActiveRecord::Base
  belongs_to :user
  # belongs_to :user, :counter_cache => :collect_posts_count
  belongs_to :post
end
