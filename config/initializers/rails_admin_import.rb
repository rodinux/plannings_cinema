# RailsAdminImport.config do |config|

#   ActiveRecord::Base.descendants.each do |model|
      
#       config.model 'Film: ' do
#         label :film
#         import do
#           include_all_fields
#           default_excluded_fields [:created_at, :seances, :villages]
#         end
#       end
      
#       config.model 'Seance: ' do
#         label :seance
#         import do
#           include_all_fields
#           default_excluded_fields [:created_at, :updated_at]
#           configure :horaire, :date do
#             strftime_format '%d/%m/%Y %H:%M'
#            end
#           end
#       end


#       config.model 'Classification: ' do
#         label :classification
#         import do
#           include_all_fields
#           exclude_fields [:created_at, :updated_at]
#         end
#       end

#       config.model 'Village: ' do
#         label :village
#         import do
#           include_all_fields
#           default_excluded_fields [:created_at, :updated_at, :seances, :films]
#         end
#       end

#       config.model 'User: ' do
#         label :user
#         import do
#           include_all_fields
#           exclude_fields [:created_at, :updated_at]
#         end
#       end

#       config.model 'Disponibilite: ' do
#         label :disponibilite
#       end
#   end
# end
