class Seat < ApplicationRecord
  has_many :screens_seats
  has_many :screens, through: :screens_seats
end
