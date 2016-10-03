class Company < ActiveRecord::Base
  has_and_belongs_to_many :technologies
  has_many :offices

  validates :name, :presence => true

  before_create :twitter_followers, unless: :twitter_handle?

  def twitter_followers
    begin
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end

      company_twitter = client.user(twitter_handle)
      self.twitter_follower_count = company_twitter.followers_count
    rescue => error
      errors.add(:base, error)
      throw(:abort)
    end
  end

  def twitter_handle?
    self.twitter_handle.empty?
  end
end
