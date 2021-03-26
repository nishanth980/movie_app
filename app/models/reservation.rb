class Reservation < ApplicationRecord
  belongs_to :seat
  belongs_to :show_time
  belongs_to :user
end
