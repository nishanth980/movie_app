class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :seat, foreign_key: true
      t.references :show_time, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :reserved

      t.timestamps
    end
  end
end
