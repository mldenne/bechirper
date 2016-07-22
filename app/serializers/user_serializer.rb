class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :auth_token
end
