class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :alias
  has_many :battles
  has_many :movies, through: :battles
  has_many :superpowers
end
