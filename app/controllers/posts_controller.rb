class PostsController < ApplicationController
  before_filter :authenticate_user! ,:only => [ :new , :create , :edit , :update , :destroy ]
  before_filter :set_top_nav, :only => [:show, :new, :create]
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

  def popular
    @top_nav_num = 3
  end

  def latest
    @top_nav_num = 4
  end

  def show
  end

  private

    def set_top_nav
      @top_nav_num = 1
    end

    def find_topic
      @topic = Topic.find(params[:topic_id])
    end

end
