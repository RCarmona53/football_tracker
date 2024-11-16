class Player < ApplicationRecord
  has_many :stats
  has_many :matches, through: :stats
end
