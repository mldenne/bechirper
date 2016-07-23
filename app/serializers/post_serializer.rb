class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at

  belongs_to :user, serializer: UserCondensedSerializer, scope: current_user, scope_name: :current_user

end
