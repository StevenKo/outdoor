class PostsController < ApplicationController
  before_filter :authenticate_user! ,:only => [ :new , :create , :edit , :update , :destroy ]
  # before_filter :find_topic, :only => [ :new , :create ]
  def new
    @post = Post.new
    # @post = @topic.posts.build
  end
  
  def create

    @post = current_user.topics.build(params[:post])

    if @post.save
      redirect_to board_topic_path(@topic.board,@topic)
    else
      render :action => :new
    end
  end
  
  private
  
  def find_topic
    @topic = Topic.find(params[:topic_id])
  end
  
end
