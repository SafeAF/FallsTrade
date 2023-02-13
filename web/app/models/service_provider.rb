class ServiceProvider < ApplicationRecord
  belongs_to :user
  has_many :offerings, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
