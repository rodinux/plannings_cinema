require 'i18n'

I18n.default_locale = :fr

RailsAdmin.config do |config|

  config.main_app_name = ["Calendriers Ecran Village", "Gestion avancée"]
  # or something more dynamic
  config.main_app_name = Proc.new { |controller| [ "Calendriers Ecran Village", "Gestion avancée - #{controller.params[:action].try(:titleize)}" ] }

  config.authenticate_with do
    # Use sorcery's before filter to auth users
    require_login
  end

  ## == Cancan ==
  config.authorize_with :cancancan

  config.current_user_method(&:current_user)

  # config.label_methods << :description

  config.browser_validations = false

  Rails.application.eager_load!

 config.included_models = ["Film", "Village", "Seance", "User", "Classification", "Disponibilite"]


 ActiveRecord::Base.descendants.each do |model|
    config.model 'Film' do
    list do
      field :titrefilm
      field :id
      field :seances do
          inverse_of :film
      end
      field :villages do
          inverse_of :films
      end
      field :classification_ids
      field :distribution
      field :description
      field :updated_at
      field :created_at
    end
    configure :titrefilm do
      label "Nom du Film: "
     end
    configure :id do
      label "ID du film: "
    end
    configure :seances do
      label "ID des séances: "
    end
    configure :villages do
      label "ID des lieux: "
    end

    configure :description do
      label "Résumé du Film: "
    end
    configure :updated_at do
      label "Mis à jour le: "
     end
    configure :distribution do
      label "Distribution: "
    end
    import do
      mapping_key :import_id
      default_excluded_fields [:created_at, :seances, :villages]
    end
    edit do
        field :classifications do
          orderable true
        end
      end
    end

    config.model 'Village' do
      list do
        field :id
        field :commune
        field :salle
        field :seances do
          inverse_of :village
        end
        field :films do
          inverse_of :villages
        end
        field :created_at
        field :updated_at
      end
      configure :id do
        label "ID du lieu: "
      end
      configure :commune do
        label "commune: "
      end
      configure :salle do
        label "salle: "
      end
      configure :seances do
        label "ID des séances: "
      end
      configure :films do
        label "ID des films: "
      end
      import do
        mapping_key :import_id
        default_excluded_fields [:created_at, :updated_at, :seances, :films]
      end
    end

    config.model 'Seance' do
      configure :horaire, :date do
        strftime_format '%d/%m/%Y %H:%M'
      end
      list do
        field :horaire
        configure :horaire, :date do
          strftime_format '%d/%m/%Y %H:%M'
        end
        field :film do
          inverse_of :seances
        end
        field :village do
          inverse_of :seances
        end
        field :projection
        field :caisse
        field :total_billets
        field :billets_adultes
        field :billets_enfants
        field :billets_scolaires
        field :extras
        field :version
        field :annulee
        field :updated_at
        field :created_at
        field :id
      end
      configure :horaire do
        label "Date et heure: "
      end
      configure :film do
        label "ID du film: "
      end
      configure :village do
        label "ID du lieu: "
      end
      configure :projection do
        label "Projection: "
      end
      configure :caisse do
        label "Caisse: "
      end
      configure :total_billets do
        label "Total Billets: "
      end
      configure :billets_adultes do
        label "Billets Adultes: "
      end
      configure :billets_enfants do
        label "Billets Enfants: "
      end
      configure :billets_scolaires do
        label "Billets Scolaires: "
      end
      configure :version do
        label "version: "
      end
      configure :extras do
        label "extras: "
      end
      configure :annulee do
        label "Annulation: "
      end
      configure :updated_at do
        label "Mis à jour le: "
      end
      configure :created_at do
        label "Créée le: "
      end
      import do
        mapping_key :import_id
        mapping_key_list [:id, :village_id, :film_id]
        default_excluded_fields [:created_at, :updated_at]
        configure :horaire, :date do
          strftime_format '%d/%m/%Y %H:%M'
         end
        end
      export do
        include_all_fields
        configure :horaire, :date do
          strftime_format '%d/%m/%Y %H:%M'
        end
      end
    end

    config.model 'User' do
      list do
        field :prenom
        field :nom
        field :email
        field :role
        field :telephone
        field :created_at
        field :updated_at
        field :id
      end
      configure :prenom do
        label "Prénom: "
      end
      configure :nom do
        label "Nom: "
      end
      configure :email do
        label "email: "
      end
      configure :telephone do
        label "téléphone: "
      end
      configure :id do
        label "ID"
      end
      import do
        mapping_key :id
        exclude_fields [:created_at, :updated_at]
      end
    end

    config.model 'Classification' do
      list do
        field :nom_classification
        field :film_ids
      end
      configure :nom_classification do
        label "Classification: "
      end
      import do
        mapping_key :film_ids
        include_all_fields
        exclude_fields [:created_at, :updated_at]
      end
    end

    config.model 'Disponibilite' do
      list do
        field :nom
        field :start_time
        field :end_time
      end
      configure :nom do
        label "Nom: "
      end
      configure :start_time do
        label "Du: "
      end
      configure :end_time do
        label "Au: "
      end
      import do
        mapping_key :nom
        exclude_fields [:created_at, :updated_at]
      end
    end
  end

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  config.actions do
    dashboard                    # mandatory
    index                         # mandatory
    new
    bulk_delete
    export
    import
    show
    edit
    delete
    show_in_app
  end
end

RailsAdminImport.config do |config|

      config.line_item_limit = 4000
      config.update_if_exists = true
      config.rollback_on_error = true

  ActiveRecord::Base.descendants.each do |model|

      config.model 'Film: ' do
        label :film
      end

      config.model 'Seance: ' do
        label :seance
      end

      config.model 'Classification: ' do
        label :classification
      end

      config.model 'Village: ' do
        label :village
      end

      config.model 'User: ' do
        label :user
      end

      config.model 'Disponibilite: ' do
        label :disponibilite
      end
  end
end
