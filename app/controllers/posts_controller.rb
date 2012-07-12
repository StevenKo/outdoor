# encoding: utf-8

class PostsController < ApplicationController
  before_filter :authenticate_user! ,:only => [ :new , :create , :edit , :update , :destroy ]
  before_filter :set_top_nav, :only => [:show, :new, :create]
  # before_filter :find_topic, :only => [ :new , :create ]
  def new
    @post = SharePost.new
    @tags = SharePost.tag_counts_on(:tags)
    @pictures = current_user.pictures
    # @pictures = Picture.all.collect{|p| p.file.median}
    # @post = @topic.posts.build
  end

  def create
    @post = current_user.share_posts.build(params[:share_post])
    @post.tag_list = params[:text][:tag_area]
    @post.picture = Picture.find(params[:picture][:id]).file if params[:picture][:id].present?
    if @post.save
      redirect_to post_path(@post)
    else
      render :action => :new
    end
    # redirect_to board_topic_path(@topic.board,@topic)
  end

  def popular
    @top_nav_num = 3
    @view_posts = SharePost.by_views.paginate(:page => params[:page], :per_page => 2)
  end

  def latest
    @top_nav_num = 4
    @recent_posts = SharePost.by_date.paginate(:page => params[:page], :per_page => 2)
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def add_tag
    @tag = params[:tag]
    respond_to do |format|
      format.js
    end
  end
  
  def add_collect
    post = SharePost.find(params[:id])
    if current_user.collect(post)
      (current_user.collect_share_posts.delete post)
      @btn_text = "收藏"
      @btn_class = "btn btn-success"
    else      
      current_user.collect_share_posts << post
      @btn_text = "已收藏"
      @btn_class = "btn btn-danger"
    end
    respond_to do |format|
      format.js
    end
  end

  private

    def set_top_nav
      @top_nav_num = 1
    end

    def find_topic
      @topic = Topic.find(params[:topic_id])
    end

end
