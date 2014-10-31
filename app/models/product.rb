class Product < ActiveRecord::Base
  attr_accessible :image, :title, :description, :price, :price_sale
  has_attached_file :image, :style => {:thumb => "120x95#"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end