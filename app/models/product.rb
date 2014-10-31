class Product < ActiveRecord::Base
  attr_accessible :image, :title, :description, :price, :title_vn, :percent_sale, :publish, :category_id
  has_attached_file :image, :style => {:thumb => "120x95#", :admin => "70x70#"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :photos
  belongs_to :category
end