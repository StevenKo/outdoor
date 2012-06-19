class Forum::PostsController < Forum::ForumController
  def create
    @post = current_user.posts.build(params[:post])
    @topic = Topic.find(params[:topic][:id])
    @post.topic_id = @topic.id
    @post.save
    redirect_to forum_board_topic_path(@topic.board,@topic)
    
    # if @topic.save
    #      redirect_to forum_board_topic_path(@topic.board,@topic)
    #    else
    #      render :action => :new
    #    end
    
  end
end
