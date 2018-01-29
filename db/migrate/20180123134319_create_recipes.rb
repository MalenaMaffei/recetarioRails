class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.string :key_words
      t.string :name
      t.string :instructions
      t.integer :parent_id
      t.integer :category_id
      t.integer :user_id
      t.string :token

      t.timestamps
    end

    add_index :recipes, :token, unique: true
    add_index :recipes, [:parent_id, :category_id, :user_id]
  end
end
