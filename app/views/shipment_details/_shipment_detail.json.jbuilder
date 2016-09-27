json.extract! shipment_detail, :id, :shipment_id, :product_id, :quanitity, :price_per_unit, :price, :created_at, :updated_at
json.url shipment_detail_url(shipment_detail, format: :json)