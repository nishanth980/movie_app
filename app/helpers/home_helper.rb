module HomeHelper
  def set_available_class(seat_id)
    @reserved_seats.present? && @reserved_seats.include?(seat_id) ? { class: "reserved", disabled: true } : { class: "available" }
  end
end
