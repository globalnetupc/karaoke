json.extract! shipment_status, :id, :shipment_id, :status_catalog_id, :status_time, :notes, :created_at, :updated_at
json.url shipment_status_url(shipment_status, format: :json)