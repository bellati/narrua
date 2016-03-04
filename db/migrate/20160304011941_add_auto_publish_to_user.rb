class AddAutoPublishToUser < ActiveRecord::Migration
  def change
    add_column :users, :auto_publish, :boolean, default: true, null: false
  end
end
