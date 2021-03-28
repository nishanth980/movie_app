class BookingsController < ApplicationController
  def reserve_seats
    screen = Screen.find(params[:screen_id])
    @screen_seats = screen.screens_seats
    @show_time = ShowTime.find_by(screen_id: params[:screen_id], slot_id: params[:slot_id], movie_date_id: params[:movie_date_id], movie_id: params[:movie_id])
    @reserved_seats = Reservation.where(show_time_id: @show_time.id).pluck(:seat_id)
  end

  def make_booking
    @show_time = ShowTime.find(params[:show_time_id])
    @seat_numbers = params[:seat_numbers].join(",")
    params[:seat_numbers].each do |seat_number|
      seat = Seat.find(seat_number)
      Reservation.create!(show_time_id: params[:show_time_id], seat_id: seat.id, user_id: current_user.id)
    end
  end

  def reports
    reservations = Reservation.joins(show_time: :movie_date).where("movie_dates.date = ?", params[:booking_date])
    send_data Report.new(reservations).perform, filename: "reports-#{Date.today}.csv"
  end
end
