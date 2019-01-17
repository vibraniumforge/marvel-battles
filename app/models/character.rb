class Character < ActiveRecord::Base

    has_many :battles
    has_many :movies, through: :battles
    has_many :superpowers

    accepts_nested_attributes_for :superpowers
    # accepts_nested_attributes_for :battles
    
    validates :name, presence: true
    validates :alias, presence: true

end
