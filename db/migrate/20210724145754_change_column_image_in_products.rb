class ChangeColumnImageInProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :image, :image_data
    change_column :products, :image_data, :text
  end
end
