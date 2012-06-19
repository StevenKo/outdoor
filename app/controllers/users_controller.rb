# encoding: utf-8

class UsersController < ApplicationController
  
  def show
    @nav_num = 0
    @user = User.find(params[:id])
    @collect_topics = @user.collect_topics
    @idols = @user.idols
  end
  
  def edit
    @nav_num = 0
  end
  
  def posts
    @nav_num = 1
    @user = User.find(params[:id])
    @posts = @user.posts
    
    # forum post not done
  end
  
  def collections
    @nav_num = 2
    @user = User.find(params[:id])
    @collect_posts = @user.collect_share_posts
  end
  
  def idols
    @nav_num = 3
    @user = User.find(params[:id])
    @idols = @user.idols
  end
  
  def followers
    @nav_num = 4
    @user = User.find(params[:id])
    @fans = @user.fans
  end
  
  def follow
    user = User.find(params[:id])
    if current_user.follow(user)
      (current_user.idols.delete user)
      @btn_text = "關注"
    else      
      current_user.idols << user
      @btn_text = "已關注"
    end
    respond_to do |format|
      format.js
    end
  end 
end
