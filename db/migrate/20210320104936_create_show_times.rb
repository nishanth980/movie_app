class CreateShowTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :show_times do |t|
      t.references :movie
      t.references :screen
      t.references :slot
      t.references :movie_date
      t.timestamps
    end
  end
end
