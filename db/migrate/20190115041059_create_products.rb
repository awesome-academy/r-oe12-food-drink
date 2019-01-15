class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :describe
      t.float :price
      t.float :price_new
      t.string :status
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end