class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :auth_token

  has_many :notes
  
end
