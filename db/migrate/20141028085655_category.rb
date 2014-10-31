class Category < ActiveRecord::Migration
  def up
  	create_table :categories do |t|
  		t.string :name
      t.datetime :update_at
      t.datetime :created_at
  	end
  end

  def down
  end
end
