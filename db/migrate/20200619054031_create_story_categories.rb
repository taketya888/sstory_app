class CreateStoryCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :story_categories do |t|
      t.integer :story_id
      t.integer :category_id

      t.timestamps
    end
    add_index :story_categories, :story_id
    add_index :story_categories, :category_id
    add_index :story_categories, [:story_id, :category_id], unique: true
  end
end
