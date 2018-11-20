require 'rails_helper'

RSpec.describe ShortUrlsController, type: :controller do
  render_views

  describe '#create' do
    it 'should create a valid url' do
      post :create, params: { short_url: { original_url: 'http://www.google.com'} }, format: :json
      expect(response.status).to eql(200)
      puts response
      expect(JSON.parse(response.body)['short_url']).to_not be_nil
    end

    it 'should not create when invalid url is given' do
      post :create, params: { short_url: { original_url: 'okie-dokie'} }, format: :json
      expect(response.status).to eql(422)
      puts response
      expect(JSON.parse(response.body)).to eql({'error' => 'Original url is invalid'})
    end
  end
end
