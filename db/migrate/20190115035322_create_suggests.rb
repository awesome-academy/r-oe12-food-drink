class CreateSuggests < ActiveRecord::Migration[5.2]
  def change
    create_table :suggests do |t|
      t.string :name
      t.string :describe
      t.float :price
      t.string :image
      t.boolean :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
