class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :people_quantity
      t.string :preparation_time
      t.string :cooking_time
      t.string :total_time
      t.string :image_url
      t.string :difficulty
      t.string :ingredients, array: true
      t.string :import_id

      t.timestamps
    end
  end
end
