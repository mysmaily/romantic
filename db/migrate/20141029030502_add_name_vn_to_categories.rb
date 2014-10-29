class AddNameVnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :name_vn, :string
  end
end
