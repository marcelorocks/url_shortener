require 'rails_helper'

RSpec.describe MainController, type: :controller do
  let(:original_url) { 'http://www.google.com' }

  describe '#translate' do
    it 'should translate a short url and redirect to original url' do
      @short_url = ShortUrl.new(original_url: original_url).save
      get :translate, params: { hash: @short_url.short_hash }
      expect(response.status).to eql(302)
      expect(subject).to redirect_to(original_url)
    end
  end
end
