json.array!(@film.seances.seances_calendrier) do |seance|
  json.extract! seance, :id, :film_id, :version, :horaire, :village_id, :extras, :annulee
end