class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :recipe_id
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, [:recipe_id, :user_id]
  end
end
