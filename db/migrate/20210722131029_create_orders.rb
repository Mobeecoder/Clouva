class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :ref_number
      t.text :address
      t.string :city
      t.string :state
      t.datetime :due_date

      t.timestamps
    end
  end
end
