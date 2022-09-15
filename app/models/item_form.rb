class ItemForm
  include ActiveModel::Model

  attr_accessor(
    :name, :content, :privacy_id, :image,
    :user_id
  )

  validates :name,       presence: true
  validates :content,    presence: true
  validates :privacy_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    Item.create(name: name, content: content, privacy_id: privacy_id, image: image, user_id: user_id)
  end
end