class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  has_one :buyer
  accepts_nested_attributes_for :buyer
  has_one :seller
  accepts_nested_attributes_for :seller
end
