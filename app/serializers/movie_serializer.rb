class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :poster
  has_many :battles
  has_many :characters
end
