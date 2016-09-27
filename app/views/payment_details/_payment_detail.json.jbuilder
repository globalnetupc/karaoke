json.extract! payment_detail, :id, :shipment_id, :payment_data_id, :value, :created_at, :updated_at
json.url payment_detail_url(payment_detail, format: :json)