class PostAllSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :bio_image, :username

  belongs_to :user

end
