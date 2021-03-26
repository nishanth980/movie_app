class Screen < ApplicationRecord
  has_many :show_times
  has_many :movies, through: :show_times
  has_many :slots, through: :show_times
  has_many :movie_dates, through: :show_times
  has_many :screens_seats
  has_many :seats, through: :screens_seats
end
