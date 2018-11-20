class MainController < ApplicationController
  def index
    @short_url = ShortUrl.new
  end

  def translate
    @short_url = ShortUrl.find(params[:hash])
    @short_url.increment_hits!
    redirect_to @short_url.original_url, status: 302
  end
end
