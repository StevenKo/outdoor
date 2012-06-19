class Forum::TopicsController < Forum::ForumController
  before_filter :authenticate_user! ,:only => [ :new , :create , :edit , :update , :destroy ]
  
  def new
    @board = Board.find(params[:board_id])
    @topic = @board.topics.build
    @tags = SharePost.tag_counts_on(:tags)
    @pictures = current_user.pictures
  end
  
  def create
    @topic = current_user.topics.build(params[:topic])
    @topic.board = Board.find(params[:board_id])
    @topic.tag_list = params[:text][:tag_area]
    if @topic.save
      redirect_to forum_board_topic_path(@topic.board,@topic)
    else
      render :action => :new
    end
    
  end
  
  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(:page => params[:page], :per_page => 2)
    @new_post = @topic.posts.build
    @pictures = current_user.pictures
  end
  
  def edit
    @board = Board.find(params[:board_id])
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to board_topic_path(@topic.board,@topic)
    else
      edit_board_topic_path(@topic.board,@topic)
    end
  end
  
  def destroy
    
  end
  
end
