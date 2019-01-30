class Movie < ActiveRecord::Base
    
    has_many :battles
    has_many :characters, through: :battles

    validates :name, presence: true
    validates :year, presence: true, numericality: { only_integer: true }
    
    def movie_directory
       "posters/#{self.poster}"
    end
end
