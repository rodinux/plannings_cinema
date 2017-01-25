json.array!(@villages) do |village|
  json.extract! village, :id, :commune, :salle
  json.url village_url(village, format: :json)
end