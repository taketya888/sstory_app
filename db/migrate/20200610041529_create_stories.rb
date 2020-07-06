class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.text :start_text
      t.text :consent_text
      t.text :terning_text
      t.text :finish_text
      t.integer :user_id
      t.boolean :status, default: true
      t.string :title
      #t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :stories, [:user_id, :created_at]
  end
end
