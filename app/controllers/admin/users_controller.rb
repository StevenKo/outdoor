class Admin::UsersController < AdminController
  def index
    @users = User.paginate(:page => params[:page], :per_page => 10, :order => 'id DESC')
  end
end