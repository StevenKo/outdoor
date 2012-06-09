class BrandsController < ApplicationController

  before_filter :set_top_nav

  def index
  end

  private

    def set_top_nav
      @top_nav_num = 7
    end
end
