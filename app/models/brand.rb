class Brand < ActiveRecord::Base
  mount_uploader :picture, BrandUploader
end
