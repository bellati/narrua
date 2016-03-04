class AddIsApprovedToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_approved, :boolean, default: true, null: false
  end
end
