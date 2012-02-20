class Topic < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  has_many :posts
end
