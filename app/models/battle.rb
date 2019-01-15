class Battle < ActiveRecord::Base

    belongs_to :movie
    belongs_to :character
    has_many :characters, through: :battles
    accepts_nested_attributes_for :characters

    
    validates :name, presence: true
    validates :location, presence: true

    def self.first_five
        all.limit(5)
    end

end
