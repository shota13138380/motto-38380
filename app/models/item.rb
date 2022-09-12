class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :privacy
  belongs_to :user

  validates :name,       presence: true
  validates :content,    presence: true
  validates :privacy_id, numericality: { other_than: 1, message: "can't be blank" }
end
