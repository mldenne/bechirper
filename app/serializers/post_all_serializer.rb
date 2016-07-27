class PostAllSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at

  belongs_to :user_all_serializer

end
