class Photo < ActiveRecord::Base
  attr_accessible :photo

  has_attached_file :photo, :style => {:lager => "500x300#"}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  belongs_to :product
end
