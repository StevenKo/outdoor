class Post < ActiveRecord::Base
  
  mount_uploader :picture, PictureUploader
  
  # @user.tag_list = "awesome, slick, hefty" User.tagged_with(['awesome, cool'] post.find_related_tags
  acts_as_taggable
  
  belongs_to :topic
  belongs_to :user
  # belongs_to :user, :counter_cache => true
  
  has_many :collect_user_post_ships
  has_many :users_to_collect, :through => :collect_user_post_ships, :source => :user
  
  scope :by_views, order('view_count DESC, created_at DESC')
  scope :by_date, order('created_at DESC')
  
end
