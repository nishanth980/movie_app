class Movie < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :show_times
  has_many :screens, through: :show_times
  has_many :slots, through: :show_times
  has_many :movie_dates, through: :show_times


  default_scope ->{ where(active: true) }
end
