json.array!(@seances.seances_semaine) do |seance|
  json.extract! seance, :id, :film_id, :version, :village_id, :horaire, :extras, :annulee
  json.url seance_url(seance, format: :json)
end
