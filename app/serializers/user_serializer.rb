class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :auth_token
end
