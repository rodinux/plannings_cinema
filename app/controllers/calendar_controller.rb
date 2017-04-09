class CalendarController < ApplicationController

   skip_before_action :require_login
   before_action :get_lieu

  def calendrier
  	  @seances = Seance.all
  	  @films = Film.all
  	  @villages = Village.all
  	  @date = params[:date] ? Date.parse(params[:date]) : Date.today
      respond_to do |format|
        format.pdf do
         render :pdf => "calendrier.pdf",
                :orientation => 'Landscape',
                :layout => "layouts/pdf.html",
                :disable_javascript => false,
                show_as_html: params[:debug].present?
        end
      format.json
      format.html
    end
  end

  def aide
  end

  private

    def get_lieu
      @lieu = params[:lieu]
    end

end
