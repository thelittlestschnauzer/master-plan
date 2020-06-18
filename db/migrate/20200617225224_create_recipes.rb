class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :position
      t.string :description
      t.string :serves
      t.string :level

      t.timestamps
    end
  end
end
