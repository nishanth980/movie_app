class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true
      t.text :image_data

      t.timestamps
    end
  end
end
