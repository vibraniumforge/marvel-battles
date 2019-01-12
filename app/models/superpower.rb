class Superpower < ActiveRecord::Base
    belongs_to :character

    validates :name, presence: true
    
end
