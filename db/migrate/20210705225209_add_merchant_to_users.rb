class AddMerchantToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :merchant, :boolean, default: false
  end
end
