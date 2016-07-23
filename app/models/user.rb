class User < ApplicationRecord

  has_many :posts

  acts_as_follower
  acts_as_followable

  has_secure_password

  validates :auth_token, presence: true, uniqueness: true

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_validation :generate_auth_token, on: :create

  def timeline_posts
    Post.timeline(self)
  end

  private

  def generate_auth_token
    while auth_token.blank? || User.exists?(auth_token: auth_token)
      self.auth_token = SecureRandom.hex(10)
    end
  end

end
