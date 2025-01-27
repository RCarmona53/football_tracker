class Match < ApplicationRecord
  has_many :stats, dependent: :destroy
  has_many :players, through: :stats

  validates :date, presence: true
end
