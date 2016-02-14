class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.integer :attending

      t.timestamps null: false
    end
  end
end
