class AddProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.attachment :image
      t.string :title
      t.string :title_vn
      t.string :description
      t.integer :price
      t.integer :percent_sale
      t.timestamps
    end
  end
end
