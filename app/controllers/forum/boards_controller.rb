class Forum::BoardsController < Forum::ForumController
  
  def index
    @boards = Board.all
    @boards_array = []
    group = @boards.size % 3
    for i in (0..group)
      @boards_array[i]  = @boards[i*3..i*3+2]
    end
  end
  
  def show
    @board = Board.find(params[:id])
    @topics = @board.topics.paginate(:page => params[:page], :per_page => 2)
  end
  
end
