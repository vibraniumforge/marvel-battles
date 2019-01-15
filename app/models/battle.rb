class Battle < ActiveRecord::Base

    belongs_to :movie
    belongs_to :character
    
    validates :name, presence: true
    validates :location, presence: true

    def self.first_five
        all.limit(5)
    end

    def movies_attributes=(movie_attributes)
        movie_attributes.values.each do |movie_attribute|
          movie = Movie.find_or_create_by(movie_attribute)
          self.battles.build(movie: movie)
        end
    end

      def characters_attributes=(character_attributes)
        character_attributes.values.each do |character_attribute|
          character = Character.find_or_create_by(character_attribute)
          self.battles.build(character: character)
        end
    end

end
