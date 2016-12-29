json.extract! seance, :id, :projection, :caisse, :horaire, :created_at, :updated_at
json.url seance_url(seance, format: :json)