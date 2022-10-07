class HeroPower < ApplicationRecord
  STRENGTH = ['Strong', 'Weak', 'Average']

  validates :strength, inclusion: {
    in: STRENGTH,
    message: "must be one of: #{STRENGTH.join(', ')}"
  }
  belongs_to :hero
  belongs_to :power
end
