class Battle < ActiveRecord::Base

    belongs_to :movie
    has_many :battle_characters
    has_many :characters, through: :battle_characters
    accepts_nested_attributes_for :characters

    
    validates :name, presence: true
    validates :location, presence: true

    def self.first_five
        all.limit(5)
    end

end
