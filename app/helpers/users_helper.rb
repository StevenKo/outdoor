module UsersHelper
  
  def my_omniauth_authorize_path resource_name, provider
    url = omniauth_authorize_path(resource_name, provider, :origin => request.fullpath)
    url = omniauth_authorize_path(resource_name, provider, :origin => params[:redirect]) unless params[:redirect].blank? 
    return url
  end
  
  def login_link_to *args, &block
    unless user_signed_in?
      args[1] = "#myModal"
      args[2]["data-toggle"] = "modal"
    end
    link_to *args, &block
  end
  
  def display_name name
    name.gsub("_"," ")
  end
end
