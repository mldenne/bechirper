class UserCondensedSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :bio_image, :user_following

  def user_following
    current_user.follows?(object)
  end

end
