class User < ActiveRecord::Base
  extend OmniauthCallbacks
  
  mount_uploader :avatar, AvatarUploader
  has_many :authorizations
  
  has_many :posts
  has_many :topics
  has_many :pictures
  
  has_many :collect_user_topic_ships
  has_many :collect_topics, :through => :collect_user_topic_ships, :source => :topic
  
  has_many :collect_user_post_ships
  has_many :collect_posts, :through => :collect_user_post_ships, :source => :post
  
  # has_many :collect_user_picture_shipss
  #   has_many :user_upload_picture, :through => :collect_user_picture_shipss, :source => :picture
  
  has_many :relations_as_fan,  :foreign_key => 'target_user_id',  :class_name => 'UserReference'
  has_many :relations_as_idol,   :foreign_key => 'follower_user_id',   :class_name => 'UserReference'    
  has_many :fans,  :through => :relations_as_idol
  has_many :idols,   :through => :relations_as_fan
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
