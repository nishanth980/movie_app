class ScreensSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :screens_seats do |t|
      t.references :seat
      t.references :screen
      t.integer :price
    end
  end
end
