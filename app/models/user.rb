class User < ActiveRecord::Base

  has_many :events, foreign_key: 'creator_id', class_name: 'Event'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.is_approved = false
      user.save!
    end
  end

  def self.with_valid_token
    User.where('oauth_expires_at > ?', Time.now)
  end
end
