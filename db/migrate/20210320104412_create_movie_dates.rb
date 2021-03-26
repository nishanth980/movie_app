class CreateMovieDates < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_dates do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
