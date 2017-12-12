json.array!(@films) do |film|
  json.extract! film, :id, :titrefilm
end