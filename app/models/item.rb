class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :images
  has_one :buyer
  has_one :seller

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :buyer
  accepts_nested_attributes_for :seller
end

