# coding: utf-8 
module ApplicationHelper
  def sign_in_div
    content_tag :div, :class => "pull-right" do
      if current_user.present?
        raw(
          "歡迎你" + current_user.name + " " +          
          content_tag( :div, :class => "btn" )do
            link_to "發表新文章",new_post_path 
          end + " " +
          content_tag( :div, :class => "btn" )do
              link_to "登出",logout_path
          end
        )
      else
        content_tag( :div, :class => "btn" )do
          link_to "登入",new_user_session_path
        end + " " +
        content_tag( :div, :class => "btn" )do
          link_to "Facebook", user_omniauth_authorize_path(:facebook)
        end  
      end
    end
  end
  
  def nav_top_bar top_nav_num
    
    class_array = Array.new(8,"")
    class_array[top_nav_num] = "active"
    
    content_tag( :li, :class => class_array[0] )do
      link_to "OutdoorGear", root_path
    end + 
    content_tag( :li, :class => class_array[1] )do
      link_to "首頁", root_path
    end +
    content_tag( :li, :class => class_array[2] )do
      link_to "論壇", forum_path
    end +
    content_tag( :li, :class => class_array[3] )do
      link_to "最受歡迎", popular_posts_path
    end +
    content_tag( :li, :class => class_array[4] )do
      link_to "最新發表", popular_posts_path
    end +
    content_tag( :li, :class => class_array[5] )do
      link_to "登山", popular_posts_path
    end +
    content_tag( :li, :class => class_array[6] )do
      link_to "二手裝備", popular_posts_path
    end +
    content_tag( :li, :class => class_array[7] )do
      link_to "品牌", brands_path
    end
  end
end
