class ShortUrlsController < ApplicationController
  def create
    @short_url = ShortUrl.new(short_url_params)
    if @short_url.valid?
      @short_url.save
      render 'create'
    else
      render 'error'
    end
  end

  def short_url_params
    params.require(:short_url).permit(:original_url)
  end
end
