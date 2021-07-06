class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.int :num_available
      t.string :name
      t.int :merchant_id
      t.string :size
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
