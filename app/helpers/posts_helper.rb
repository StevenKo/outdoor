# encoding: utf-8
module PostsHelper
  def render_collect_btn post
    if current_user.collect(post)
      button_to "已收藏",add_collect_post_path(@post), :class => "btn btn-danger", :remote => true, :method => :put, :id => "btn-collect"
    else  
      button_to "收藏",add_collect_post_path(@post), :class => "btn btn-success", :remote => true, :method => :put, :id => "btn-collect"
    end
  end
  def render_follow_btn user
    if current_user.follow(user)
      button_to "已關注",follow_user_path(user), :class => "btn btn-info", :remote => true, :method => :put, :id => "btn-follow"
    else  
      button_to "關注",follow_user_path(user), :class => "btn btn-info", :remote => true, :method => :put, :id => "btn-follow"
    end
  end
end
