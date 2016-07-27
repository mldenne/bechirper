class PostAllSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :bio_image, :username

end
