class ServiceProvider < ApplicationRecord
  belongs_to :user
  has_many :offerings, dependent: :destroy

  alias_attribute :provider, :service_provider
  validates :name, presence: true, uniqueness: true
end
