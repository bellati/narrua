class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :facebook_id
      t.integer :attending_count
      t.boolean :can_guests_invite
      t.string :category
      t.integer :cover_offset_x
      t.integer :cover_offset_y
      t.string :cover_source
      t.string :cover_id
      t.integer :declined_count
      t.text :description
      t.datetime :end_time
      t.boolean :guest_list_enabled
      t.integer :interested_count
      t.boolean :is_page_owned
      t.boolean :is_viewer_admin
      t.integer :maybe_count
      t.string :name
      t.integer :noreply_count
      t.string :owner_name
      t.string :owner_id
      t.string :parent_group
      t.string :place_name
      t.string :place_location_city
      t.string :place_location_country
      t.float :place_location_latitude
      t.float :place_location_longitude
      t.string :place_location_state
      t.string :place_location_street
      t.string :place_id
      t.datetime :start_time
      t.string :timezone
      t.datetime :updated_time

      t.timestamps null: false
    end
  end
end
