class WelcomeController < ApplicationController
  before_filter :set_top_nav
  
  def index
    @posts = SharePost.all
    @view_posts = SharePost.by_views.limit(5)
    @recent_posts = SharePost.by_date.limit(5)
    @tags = SharePost.tag_counts_on(:tags)
  end
  
  def set_top_nav
    @top_nav_num = 1
  end
end
