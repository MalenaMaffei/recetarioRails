class AddTimeToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :time, :time
  end
end
