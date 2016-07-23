class UserSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :username,
    :auth_token,
    :bio_image,
    :bio,
    :post_count,
    :followers_count,
    :followees_count

  def post_count
    object.posts.count
  end

end
