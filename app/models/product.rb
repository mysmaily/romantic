class Product < ActiveRecord::Base
  
  attr_accessible :image, :title, :description, :price, :title_vn, :percent_sale, :publish, :category_id
  has_attached_file :image, :style => {:thumb => "120x95#", :admin => "60x60#"},
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  has_many :photos
  belongs_to :category
  accepts_nested_attributes_for :photos, allow_destroy: true
end