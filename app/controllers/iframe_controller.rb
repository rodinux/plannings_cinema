class IframeController < ApplicationController
   layout "layouts/iframe"
   skip_before_action :require_login
   before_action :get_lieu
   after_action :allow_iframe, only: :calendrier_iframe

  def calendrier_iframe
      @seances = Seance.all
  	  @films = Film.all
  	  @villages = Village.all
  	  @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  private

    def get_lieu
      @lieu = params[:lieu]
    end

end

