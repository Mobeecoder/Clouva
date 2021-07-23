class AddFieldsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :phone, :integer
    add_column :orders, :email, :string
    add_column :orders, :lga, :string
  end
end
