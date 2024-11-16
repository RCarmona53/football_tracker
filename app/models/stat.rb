class Stat < ApplicationRecord
  belongs_to :player
  belongs_to :match

  validates :present, inclusion: { in: [true, false] }
end
