class UsersController < ApplicationController
  
  def show
    @nav_num = 0
    @user = User.find(params[:id])
    @collect_topics = @user.collect_topics
    @idols = @user.relations_as_idol
  end
  
  def edit
    @nav_num = 0
  end
  
  def posts
    @nav_num = 1
  end
  
  def collections
    @nav_num = 2
  end
  
  def followers
    @nav_num = 4
  end
  
  def idols
    @nav_num = 3
  end
  
   
end
