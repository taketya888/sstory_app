class AddStatusToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :status, :boolean, default: true
  end
end
