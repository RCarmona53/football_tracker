class Match < ApplicationRecord
  has_many :stats
  has_many :players, through: :stats
end
