json.extract! entree, :id, :billet, :nombre, :created_at, :updated_at
json.url entree_url(entree, format: :json)