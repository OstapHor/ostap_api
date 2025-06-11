class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :rating
end
