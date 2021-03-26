class ShowTime < ApplicationRecord
  belongs_to :movie
  belongs_to :slot
  belongs_to :screen
  belongs_to :movie_date
end
