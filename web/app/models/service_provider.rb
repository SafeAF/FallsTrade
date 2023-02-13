class ServiceProvider < ApplicationRecord
  belongs_to :user
  has_many :offerings

  alias_attribute :provider, :service_provider
end
