class Forum::ForumController < ApplicationController
  
  before_filter :set_top_nav

  private

    def set_top_nav
      @top_nav_num = 2
    end
  
end