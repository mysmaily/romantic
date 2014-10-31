class Category < ActiveRecord::Base

  attr_accessible :name, :name_vn, :update_at, :created_at
  has_many :products

end