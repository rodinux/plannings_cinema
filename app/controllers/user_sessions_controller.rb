class UserSessionsController < ApplicationController

     before_action :set_locale
    def set_locale
      I18n.locale = :fr
    end

     skip_before_action :require_login, except: [:destroy]

  	def new
  	    @user = User.new
  	end

    def create
      if @user = login(params[:email], params[:password])
        if @user.role == "guest"
          redirect_back_or_to(root_path, notice: 'Connexion réussie !')
        else
          redirect_back_or_to(edition_calendrier_path(:lieu => "tous les lieux"), notice: 'Connexion réussie !')
        end
      else
       flash.now[:error] = "Oups! une erreur semble-t-il... veuillez recommencez s'il vous plaît."
       render action: 'new'
      end
  end

    def destroy
      logout
      redirect_back_or_to(root_path, notice: 'Déconnecté !')
    end
end
