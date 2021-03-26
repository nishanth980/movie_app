class MovieDate < ApplicationRecord
  has_many :show_times
  has_many :screens, through: :show_times
  has_many :movies, through: :show_times
  has_many :slots, through: :show_times
end
