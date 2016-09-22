json.extract! song, :id, :song_id, :name, :singer_band, :description, :duration, :genere_id, :code, :rate, :created_at, :updated_at
json.url song_url(song, format: :json)