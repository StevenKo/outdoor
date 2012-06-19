class Admin::TagsController < AdminController
  def index 
    @tags = Tag.paginate(:page => params[:page], :per_page => 10, :order => 'id DESC')
  end
end
