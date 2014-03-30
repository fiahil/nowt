class User < ActiveRecord::Base
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :omniauthable,
    :omniauth_providers => [:facebook, :twitter, :google_oauth2]

  acts_as_commontator
  
  attr_accessor :login

  has_many :posts
  has_many :tags, through: :user_tag
  has_many :user_tag

  attr_reader :tag_tokens

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.email
    end
  end

  def self.find_for_twitter_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = "#{auth.info.nickname}_#{Devise.friendly_token[0,6]}@change_me.com"
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.nickname
    end
  end

  def self.find_for_google_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.email
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
