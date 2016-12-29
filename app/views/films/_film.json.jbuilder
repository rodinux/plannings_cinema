json.extract! film, :id, :titrefilm, :description, :created_at, :updated_at
json.url film_url(film, format: :json)