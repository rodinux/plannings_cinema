json.array!(@seances.seances_a_venir) do |seance|
  json.extract! seance, :id, :film_id, :version, :village_id, :horaire, :extras, :annulee
end