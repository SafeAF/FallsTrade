class Listing < ApplicationRecord
  # Dont forget to validate

  broadcasts_to ->(listing) {'listings'}


  belongs_to :user

 
  has_rich_text :description

  has_many :comments, dependent: :destroy

  validates :description, length: {maximum: 1000}, allow_blank: false
  validates :title, length: {maximum: 70}, allow_blank: false


  has_many_attached :pictures
  validates :pictures, attached: true,
                       processable_image: true,
                       content_type: [:png, :jpg, :jpeg]
                       
  has_one_attached :image
  # validates :image, attached: true,
  # processable_image: true,
  # content_type: [:png, :jpg, :jpeg]

  # validate :image_type
  #
  #
  #
  # def image_type
  #   if image.attached? == false
  #     errors.add(:image, "is missing!")
  #   end
  #   if !image.content_type.in?(%('image/jpeg image/png'))
  #     errors.add(:image, "needs to be a jpeg or png!")
  #    end
  #  end

  def image_as_thumbnail
    # guard clause
    return unless image.content_type.in?(%w[image/jpeg image/png])

    image.variant(resize_to_limit: [300, 300]).processed
  end

  def pictures_as_thumbnails
    pictures.map do |picture|
      if !picture.content_type.in?(%('image/jpeg image/png image/jpg'))
        errors.add(:image, "needs to be a jpeg or png!")
      else
      picture.variant(resize_to_limit: [300, 225]).processed
    end
    end
  end
end


# To resize images put this in _listing view
# <%= link_to image_tag(listing.image_as_thumbnail), listing.image_as_thumbnail %>
# add if pin.image.attached? after link
# <% listing.pictures_as_thumbnails.each do |picture| %>
# <%= link_to image_tag(picture, style: "width: 150px; height: 150px") %>
# <% end %>
