class Topic < ActiveRecord::Base
  
  acts_as_taggable
  
  belongs_to :board
  belongs_to :user
  has_many :posts
  
  has_many :collect_user_topic_ships
  has_many :users_to_collect, :through => :collect_user_topic_ships, :source => :user
  
end
