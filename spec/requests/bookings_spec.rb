require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  before(:each) do
    sign_in FactoryBot.create(:user, role_id: Role.create!(name: "admin").id)
  end

  describe "GET bookings/reports" do
    it "will test the reports of admin" do
      #this will make a booking
      movie = Movie.create!(name: 'blackpanther', description: 'it is an action movie')
      slot = Slot.create!(time: '12-3')
      movie_date = MovieDate.create!(date: '27-03-2021')
      screen = Screen.create!(name: 'screen1')
      seat = Seat.create!(number: 'A1')
      show_time = ShowTime.create!(movie_id: movie.id, screen_id: screen.id, slot_id: slot.id, movie_date_id: movie_date.id)
      reservation = Reservation.create!(show_time_id: show_time.id, seat_id: seat.id, user_id: User.first.id)
      get '/bookings/reports', params: { booking_date: movie_date.date }
      expect(body).to include('screen1')
      expect(body).to include('A1')
    end
  end
end
