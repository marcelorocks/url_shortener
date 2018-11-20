class ShortUrl
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :original_url, :short_hash, :hits
  validates :original_url, presence: true

  class RecordNotFound < StandardError; end

  HASH_LENGTH = 10

  def self.redis_client
    @@redis_client ||= Redis.new(url: 'redis://127.0.0.1:6379/1')
  end

  def self.find(hash)
    data = HashWithIndifferentAccess.new(JSON.parse(redis_client.get(hash)))
    new(short_hash: hash, original_url: data[:original_url], hits: data[:hits].to_i)
  rescue StandardError => _e
    raise RecordNotFound
  end

  def redis_client
    self.class.redis_client
  end

  def new_hash
    (0...HASH_LENGTH).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def save
    self.short_hash = new_hash
    self.short_hash = new_hash while redis_client.get(short_hash).present?
    redis_client.set(short_hash, to_json)
    self.class.find(short_hash)
  end

  def increment_hits!
    self.hits = hits.to_i + 1
    redis_client.set(short_hash, to_json)
  end

  def to_json
    { original_url: original_url, hits: hits.to_i }.to_json
  end
end
