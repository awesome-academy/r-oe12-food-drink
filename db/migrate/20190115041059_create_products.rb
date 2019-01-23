class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :describe
      t.integer :quantity
      t.string :picture
      t.float :price
      t.float :price_new
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
