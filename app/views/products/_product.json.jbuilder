json.extract! product, :id, :product_id, :product_name, :product_description, :product_type_id, :unit, :price_per_unit, :created_at, :updated_at
json.url product_url(product, format: :json)