# encoding: utf-8

class CategoryController < ApplicationController
  def index
    keyword = params[:keyword]
    @top_nav_num = case keyword
      when "登山" then 5
      when "二手裝備" then 6
      else 7
    end
    @posts = Post.tagged_with(keyword).by_date.paginate(:page => params[:page], :per_page => 2)
  end
end
