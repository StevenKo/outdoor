class Post < ActiveRecord::Base
  
  # @user.tag_list = "awesome, slick, hefty" User.tagged_with(['awesome, cool'] post.find_related_tags
  acts_as_taggable
  
  belongs_to :topic
  belongs_to :user
  
  
  has_many :collect_user_post_ships
  has_many :users_to_collect, :through => :collect_user_post_ships, :source => :user
  
end
