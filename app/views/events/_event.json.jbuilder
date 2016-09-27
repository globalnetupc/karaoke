json.extract! event, :id, :event_id, :name, :description, :date_event, :time_event, :capacity, :created_at, :updated_at
json.url event_url(event, format: :json)