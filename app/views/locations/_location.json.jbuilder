json.extract! location, :id, :location_id, :name, :description, :address, :phone, :coordenate, :management, :city_id, :created_at, :updated_at
json.url location_url(location, format: :json)