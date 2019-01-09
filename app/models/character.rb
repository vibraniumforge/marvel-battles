class Character < ApplicationRecord
    has_many :battles
    has_many :movies, through: :battles
end
