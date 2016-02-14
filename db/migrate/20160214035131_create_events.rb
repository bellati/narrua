class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :address
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :price
      t.integer :attending

      t.timestamps null: false
    end
  end
end
