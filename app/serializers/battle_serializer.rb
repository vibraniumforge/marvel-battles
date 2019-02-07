class BattleSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :character_id, :movie_id
  belongs_to :movie
  belongs_to :character
end
