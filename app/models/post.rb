class Post < ApplicationRecord

  def self.timeline(user)
    following_ids = user.followees.pluck(:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end
  
end
