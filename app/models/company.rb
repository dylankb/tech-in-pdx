class Company < ActiveRecord::Base
  has_and_belongs_to_many :technologies

  has_many :offices
  has_many :locations, through: :offices

  validates :name, :presence => true

  before_create :twitter_api_call, if: :twitter_handle?

  def twitter_api_call
    begin
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end

      company_twitter = client.user(twitter_handle)
      self.description = company_twitter.description
      self.website = company_twitter.website
      self.profile_banner_uri = company_twitter.profile_banner_uri
      self.profile_image_uri = regular_image_size(company_twitter.profile_image_uri.to_s)
      self.twitter_follower_count = company_twitter.followers_count
    rescue => error
      errors.add(:base, error)
      throw(:abort)
    end
  end

  def twitter_handle?
    !self.twitter_handle.empty?
  end

  def regular_image_size(uri)
    uri.gsub(/_\w+(\.\w+)\z/, '\1')
  end
end
