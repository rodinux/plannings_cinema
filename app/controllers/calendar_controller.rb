class CalendarController < ApplicationController

   skip_before_action :require_login

  def calendrier
  	  @seances = Seance.all
  	  @films = Film.all
  	  @villages = Village.all
  	  lieu = params[:lieu]
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
end
