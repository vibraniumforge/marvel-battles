class Movie < ApplicationRecord
    
    has_many :battles
    has_many :characters, through: :battles

    validates :name, presence: true
    validates :year, presence: true, numericality: { only_integer: true }
end
