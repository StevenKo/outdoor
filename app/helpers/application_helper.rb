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
end
