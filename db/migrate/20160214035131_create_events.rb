class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :address
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :price
      t.integer :attending
      t.text :description

      t.timestamps null: false
    end
  end
end
