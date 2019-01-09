class Character < ApplicationRecord
    has_many :battles
    has_many :movies, through: :battles

    validates :name, presence: true
    validates :callsign, presence: true
end
