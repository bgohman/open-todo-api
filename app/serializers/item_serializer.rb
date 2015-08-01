class ItemSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :body
end
