class WelcomeController < ApplicationController
  before_filter :set_top_nav
  
  def index
    @posts = Post.all
    @view_posts = Post.by_views.limit(5)
    @recent_posts = Post.by_date.limit(5)
    @tags = Post.tag_counts_on(:tags)
  end
  
  def set_top_nav
    @top_nav_num = 1
  end
end
