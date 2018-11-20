require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  it 'should create a new short url based on a valid original url' do
    s = ShortUrl.new(original_url: 'http://www.google.com', hits: 0)
    s.save
    expect(s.short_hash).to_not be_nil
    expect(ShortUrl.find(s.short_hash).original_url).to eql(s.original_url)
  end

  it 'should fail if no original url is given' do
    s = ShortUrl.new
    expect(s).to_not be_valid
  end

  it 'should increment hits for metrics' do
    s = ShortUrl.new(original_url: 'http://www.google.com', hits: 0)
    s.save
    s.increment_hits!
    expect(s.hits).to eql(1)
    expect(ShortUrl.find(s.short_hash).hits).to eql(1)
  end
end
