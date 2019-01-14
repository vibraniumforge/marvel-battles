class Superpower < ActiveRecord::Base
    
    belongs_to :character

    validates :name, presence: true
    validates :character_id, presence: true
    
end
