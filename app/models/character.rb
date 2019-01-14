class Character < ActiveRecord::Base

    has_many :battles
    has_many :movies, through: :battles
    has_one :superpower
    accepts_nested_attributes_for :superpower
    
    validates :name, presence: true
    validates :callsign, presence: true
    
end
