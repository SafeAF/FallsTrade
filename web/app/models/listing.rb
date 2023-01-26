class Listing < ApplicationRecord
  belongs_to :user

  #has_one_attached :image
  has_many_attached :pictures
  has_rich_text :description
end
