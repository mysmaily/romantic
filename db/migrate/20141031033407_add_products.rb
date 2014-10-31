class AddProducts < ActiveRecord::Migration
  def change
    create table :products do |t|
      t.string :image
      t.string :title
      t.string :description
      t.integer :price
      t.integer :price_sale
      t.timestamps
    end
  end
end
