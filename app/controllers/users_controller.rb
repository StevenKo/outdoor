class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @collect_topics = @user.collect_topics
    @idols = @user.relations_as_idol
  end
end
