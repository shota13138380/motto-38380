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

  def save(tag_list)
    item = Item.create(name: name, content: content, privacy_id: privacy_id, image: image, user_id: user_id)
    tag_list.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ItemTag.create(item_id: item.id, tag_id: tag.id)
    end
  end

  def update(params, item)
    item.item_tags.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    item.update(params)
    ItemTag.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end
end