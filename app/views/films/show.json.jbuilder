json.array!(@film.seances.seances_1_mois_avant_apres) do |seance|
  json.extract! seance, :id, :film_id, :version, :horaire, :village_id, :extras, :annulee
end