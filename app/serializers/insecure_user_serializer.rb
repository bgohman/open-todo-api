class InsecureUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :name

  def name
    object.name
  end

end
