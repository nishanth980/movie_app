class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.string :time
      t.timestamps
    end
  end
end
