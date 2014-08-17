class User < ActiveRecord::Base
  has_many :shots

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end

  def self.login_finder(login)
    find_by_username(login) || find_by_email(login)
  end

  def avatar(size = :thumb)
    pixel = { thumb: 50, small: 100, medium: 300, large: 600 }
    md5 = Digest::MD5.hexdigest(email)
    "https://secure.gravatar.com/avatar/#{md5}?s=#{pixel[size]}"
  end

  def to_s
    name
  end
end
