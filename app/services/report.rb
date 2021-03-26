class Report
  require 'csv'

  def initialize(reservations)
    @reservations = reservations
  end

  def perform
    attributes = ['screen_number', 'seat_number']
    CSV.generate(headers: true) do |csv|
      csv << attributes
      @reservations.each do |reservation|
        csv << [reservation.show_time.screen.name, reservation.seat.number]
      end
    end
  end
end