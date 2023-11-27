class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.string :price
      t.integer :quantity
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
