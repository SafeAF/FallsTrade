json.extract! listing, :id, :title, :category, :description, :location, :price, :created_at, :updated_at
json.url listing_url(listing, format: :json)
