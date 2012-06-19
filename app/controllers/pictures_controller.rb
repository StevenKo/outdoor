class PicturesController < ApplicationController
  skip_filter :verify_authenticity_token, :only => [:upload]
  def upload
    self.create params[:fname]
    render :json => {:picture_id => @picture.id, :url => @picture.file.url ,  :median =>  @picture.file.median.url , :thumb => @picture.file.thumb.url }
  end

  protected

  def create fname
    if params.key?(:file)
      Rails.logger.debug("file: #{params[:file]}")
      @picture = current_user.pictures.build
      @picture.file = params[:file]
      @picture.save
    end
  end
end
