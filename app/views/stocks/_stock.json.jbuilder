json.extract! stock, :id, :product_id, :in_stock, :last_update_time, :created_at, :updated_at
json.url stock_url(stock, format: :json)