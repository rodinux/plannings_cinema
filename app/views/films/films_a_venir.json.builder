json.array!(@films.films_2_mois_avant) do |film|
  json.extract! film, :id, :titrefilm
  json.url film_url(film, format: :json)
end