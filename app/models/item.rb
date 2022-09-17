class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :privacy
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_one_attached :image
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
end
