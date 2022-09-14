class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :privacy
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_one_attached :image

  validates :name,       presence: true
  validates :content,    presence: true
  validates :privacy_id, numericality: { other_than: 1, message: "can't be blank" }
end
