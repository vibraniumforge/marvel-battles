class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :alias
  has_many :battles
  has_many :movies
  has_many :superpowers
end
