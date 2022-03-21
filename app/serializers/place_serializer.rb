class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :price, :category, :notes, :image
  has_one :user
end
