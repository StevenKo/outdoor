module UsersHelper
  
  def display_name name
    name.gsub("_"," ")
  end
end
