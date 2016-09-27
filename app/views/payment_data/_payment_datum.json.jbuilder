json.extract! payment_datum, :id, :payment_data_id, :payment_type_id, :data_name, :data_type, :created_at, :updated_at
json.url payment_datum_url(payment_datum, format: :json)