class Character < ActiveRecord::Base

    has_many :battles
    has_many :movies, through: :battles
    has_many :superpowers

    accepts_nested_attributes_for :superpowers
    # accepts_nested_attributes_for :battles
    
    validates :name, presence: true
    validates :alias, presence: true

    def self.tony
        Character.where(name: "Tony Stark")
    end

    def self.vibranium_characters
        joins(:superpowers).where(superpowers: {"name LIKE ?": "%Vibranium%"})
    end

    def self.magic_characters
        # joins(:superpowers).where(superpowers: {name: "%Magic%"})
        # joins(:superpowers).where(superpowers: {'name LIKE ?, "%name%"'})
        Character.superpowers.where("name LIKE ?", "%Magic%")
    end

    def self.steves
        Character.where("name LIKE ?", "%Steve%")
    end

end
