class Player < ApplicationRecord
  has_many :stats, dependent: :destroy
  has_many :matches, through: :stats
end
