class Power < ApplicationRecord
    has_many :heroes
    has_many :heroes, through: :hero_powers
end
