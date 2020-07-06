class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :story_id

      t.timestamps

      t.index :user_id
      t.index :story_id
      t.index [:user_id, :story_id], unique: true
    end
  end
end
