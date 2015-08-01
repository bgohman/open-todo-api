class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :email

  def name
    object.name
  end

end
