class ItemForm
  include ActiveModel::Model

  attr_accessor(
    :name, :content, :privacy_id, :image,
    :user_id,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :tag_name
  )

  validates :name,       presence: true
  validates :content,    presence: true
  validates :privacy_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    item = Item.create(name: name, content: content, privacy_id: privacy_id, image: image, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTag.create(item_id: item.id, tag_id: tag.id)
  end

  def update(params, item)
    item.update(params)
  end
end