class PicturesController < ApplicationController
  skip_filter :verify_authenticity_token, :only => [:upload]
  before_filter :get_media
  def upload
    self.create params[:fname]
    render :json => {:url => @picture.file.url ,  :median =>  @picture.file.median.url , :thumb => @picture.file.thumb.url }
  end

  protected

  def create fname
    if params.key?(:file)
      Rails.logger.debug("file: #{params[:file]}")
      @picture.file = params[:file]
      @picture.save
    end
  end

  private

  def get_media
    @picture = Picture.new
  end
end
