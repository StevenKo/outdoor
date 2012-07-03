class UserReference < ActiveRecord::Base
  belongs_to :fan, :foreign_key => "target_user_id",  :class_name => "User"
	belongs_to :idol,  :foreign_key => "follower_user_id",   :class_name => "User", :counter_cache => :idols_count
end
