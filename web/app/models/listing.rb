class Listing < ApplicationRecord
  # Dont forget to validate
  
  belongs_to :user

  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :description

  def image_as_thumbnail
    # guard clause
    return unless image.content_type.in?(%w[image/jpeg image/png])

    image.variant(resize_to_limit: [300, 300]).processed
  end

  def pictures_as_thumbnails
    pictures.map do |picture|
      picture.variant(resize_to_limit: [150, 150]).processed
    end
  end
end


# To resize images put this in _listing view
# <%= link_to image_tag(listing.image_as_thumbnail), listing.image_as_thumbnail %>
# add if pin.image.attached? after link
# <% listing.pictures_as_thumbnails.each do |picture| %>
# <%= link_to image_tag(picture, style: "width: 150px; height: 150px") %>
# <% end %>
