class Battle < ActiveRecord::Base

    belongs_to :movie
    has_many :battle_characters
    has_many :characters, through: :battle_characters
    
    validates :name, presence: true
    validates :location, presence: true

    # def is_cap
    #     BattleCharacter.where(Character.name: 'Steve Rogers').
    # end

end
