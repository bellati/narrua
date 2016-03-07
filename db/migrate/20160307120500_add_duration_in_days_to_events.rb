class AddDurationInDaysToEvents < ActiveRecord::Migration
  def change
    add_column :events, :duration_in_days, :integer, default: 0
  end
end
