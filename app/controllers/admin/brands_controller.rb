class Admin::BrandsController < AdminController
  def index
    @brands = Brand.paginate(:page => params[:page], :per_page => 10, :order => 'id DESC')
  end
end