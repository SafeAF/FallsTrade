json.extract! service_provider, :id, :name, :company, :bio, :phone, :email, :user_id, :created_at, :updated_at
json.url service_provider_url(service_provider, format: :json)
