class Admin::SharePostsController < AdminController
  def index
    @share_posts = SharePost.paginate(:page => params[:page], :per_page => 10, :order => 'id DESC')
  end
  def show
    @share_post = SharePost.find(params[:id])
  end
end