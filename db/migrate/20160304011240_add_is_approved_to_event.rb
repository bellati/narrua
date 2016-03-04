class AddIsApprovedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :is_approved, :boolean, default: true, null: false
  end
end
