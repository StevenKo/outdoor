class User < ActiveRecord::Base
  extend OmniauthCallbacks

  mount_uploader :avatar, AvatarUploader
  has_many :authorizations

  has_many :posts
  has_many :topics
  has_many :pictures
  has_many :share_posts

  has_many :collect_user_topic_ships
  has_many :collect_topics, :through => :collect_user_topic_ships, :source => :topic

  has_many :collect_user_post_ships
  has_many :collect_posts, :through => :collect_user_post_ships, :source => :post
  
  has_many :collect_user_share_post_ships
  has_many :collect_share_posts, :through => :collect_user_share_post_ships, :source => :post

  has_many :relations_as_fan,  :foreign_key => 'target_user_id',  :class_name => 'UserReference'
  has_many :relations_as_idol,   :foreign_key => 'follower_user_id',   :class_name => 'UserReference'
  has_many :fans,  :through => :relations_as_idol
  has_many :idols,   :through => :relations_as_fan


  # bellow method cannot follow a lot of people
  #
  #  # belongs_to :fan, :class_name => 'User', :foreign_key => :target_user_id
  #  # belongs_to :idol, :class_name => 'User', :foreign_key => :follower_user_id
  #  # has_many :fans,  :class_name => 'User', :foreign_key => :follower_user_id
  #  # has_many :idols,   :class_name => 'User', :foreign_key => :target_user_id

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def collect post
    self.collect_share_posts.each do |p|
      return true if p == post
    end
    return false
  end

  def follow user
    self.idols.each do |u|
      return true if u == user
    end
    return false
  end

end
