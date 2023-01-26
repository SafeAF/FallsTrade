class Listing < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :description

  def image_as_thumbnail
    return nil if not image
    image.variant(resize_to_limit: [300, 300]).processed
  end

  def pictures_as_thumbnails
    pictures.map do |picture|
      picture.variant(resize_to_limit: [150, 150]).processed
    end
  end
end


# To resize images put this in _listing view
# <%= link_to image_tag(listing.image_as_thumbnail), listing.image %>
#
# <% listing.pictures_as_thumbnails.each do |picture| %>
# <%= link_to image_tag(picture, style: "width: 150px; height: 150px") %>
# <% end %>
