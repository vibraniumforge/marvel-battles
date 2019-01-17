class Superpower < ActiveRecord::Base
    
    belongs_to :character

    validates :name, presence: true
    validates :character, presence: true
   
    def character_attributes(character_attributes_attributes)
        character_attributes_attributes.values.each do |character_attributes|
          if character_attributes[:name].present?
            character= Character.find_or_create_by(character_attributes)
            if !self.character = character
              self.build_character(:name => character[:name])
            end
          end
        end
      end

end
