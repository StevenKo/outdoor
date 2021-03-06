# coding: utf-8 
module ApplicationHelper
  
  def tag_autocomplete_js(field_id)
      # source = languages_index_url
      parameter = {
        :defaultText => '',
        :unique => true
      }
      javascript_tag "$(document).ready(function(){
        $(\"\##{field_id}\").tagsInput(#{parameter.to_json});
      });"
  end
  
  def sign_in_div
    content_tag :div, :class => "pull-right" do
      if current_user.present?
        raw(
          "歡迎你" + link_to(current_user.name, user_path(current_user)) + " " +          
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
    
    top_nav_num ||= 1
    class_array = Array.new(8,"")
    class_array[top_nav_num] = "active"
    
    content_tag( :li, :class => class_array[0] )do
      link_to "OutdoorGear", root_path
    end + 
    content_tag( :li, :class => class_array[1] )do
      link_to "首頁", root_path
    end +
    content_tag( :li, :class => class_array[3] )do
      link_to "最受歡迎", popular_posts_path
    end +
    content_tag( :li, :class => class_array[4] )do
      link_to "最新發表", latest_posts_path
    end +
    content_tag( :li, :class => class_array[5] )do
      link_to "登山", category_index_path("登山")
    end +
    content_tag( :li, :class => class_array[6] )do
      link_to "二手裝備", category_index_path("二手裝備")
    end +
    content_tag( :li, :class => class_array[7] )do
      link_to "品牌", brands_path
    end
  end
end
