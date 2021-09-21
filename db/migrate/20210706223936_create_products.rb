class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.references :merchant
      t.string :size
      t.text :image
      t.text :description
      t.integer :num_available

      t.timestamps
    end
    add_foreign_key :products, :users, column: :merchant_id
  end
end
