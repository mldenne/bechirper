class Post < ApplicationRecord

  belongs_to :user, optional: true
  validates :body, presence: true

  def self.timeline(user)
    following_ids = user.followees.pluck(:id)
    all_ids = following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

end
